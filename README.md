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
| items_name         | string              | null: false                    |
| explain            | text                | null: false                    |
| category_id        | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| delivery_id        | integer             | null: false                    |
| area_id            | integer             | null: false                    |
| shipping_date_id   | integer             | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_one :buy

## orders table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association

* has_one :address
* belongs_to :item
* belongs_to :user

## address table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| order              | references          | null: false, foreign_key: true |
| post_code          | string              | null: false                    |
| area_id            | integer             | null: false                    |
| city               | string              | null: false                    |
| addresses          | string              | null: false                    |
| building           | string              |                                |
| phone_number       | string              | null: false                    |

### Association

* belongs_to :buy