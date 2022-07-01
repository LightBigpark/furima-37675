# DB 設計

## users table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false                    |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| last_name          | string              | null: false                    |
| first_name         | string              | null: false                    |
| last_kana          | string              | null: false                    |
| first_kana         | string              | null: false                    |
| birthday           | date                | null: false                    |

### Association

* has_many :items
* has_many :buys

## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| image              | text                | null: false                    |
| items_name         | string              | null: false                    |
| explain            | text                | null: false                    |
| category_id        | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| delivery_id        | integer             | null: false                    |
| area_id            | integer             | null: false                    |
| date_id            | integer             | null: false                    |
| price              | integer             | null: false                    |
| users              | references          | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_one :buys

## buys table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| users              | references          | null: false, foreign_key: true |
| items              | references          | null: false, foreign_key: true |

### Association

* has_one :address
* belongs_to :items
* belongs_to :users

## address table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| buys               | references          | null: false, foreign_key: true |
| post_code          | integer             | null: false                    |
| state_id           | integer             | null: false                    |
| city               | string              | null: false                    |
| street             | string              | null: false                    |
| building           | string              | null: false                    |
| phone              | integer             | null: false                    |

### Association

* belongs_to :buys