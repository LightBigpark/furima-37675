class CreateUseraddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :useraddresses do |t|
      t.references :order,        null: false,  foreign_key: true
      t.string     :post_code,    null: false
      t.integer    :area_id,      null: false
      t.string     :city,         null: false
      t.string     :addresses,    null: false
      t.string     :building,     null: false
      t.string     :phone_number, null: false
      t.timestamps
    end
  end
end
