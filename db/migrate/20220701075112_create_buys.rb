class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :users,        null: false, foreign_key: true
      t.references :buys,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
