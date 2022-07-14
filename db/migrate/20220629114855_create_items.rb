class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :image,        null: false
      t.string     :items_name,   null: false
      t.text       :explain,      null: false
      t.integer    :category_id,  null: false
      t.integer    :condition_id, null: false
      t.integer    :delivery_id,  null: false
      t.integer    :area_id,      null: false
      t.integer    :shipping_date_id,      null: false
      t.integer    :price,        null: false
      t.references :users,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
