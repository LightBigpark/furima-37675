class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      #t.integer :post_code, null:false
      #t.integer :state_id,  null:false
      #t.string  :city,      null:false
      #t.string  :street,    null:false
      #t.string  :building,  null:false
      #t.integer :phone,     null:false
      #t.references :buys,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
