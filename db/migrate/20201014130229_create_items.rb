class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :description,            null: false
      t.integer :genre_id,            null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_charge_id,  null: false
      t.integer :prefecture_id,       null: false
      t.integer :preparation_day_id,  null: false
      t.integer :price,               null: false
      t.references :user,             null: false
      t.timestamps                    null: false, foreign_key: true
    end
  end
end
