class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :condition, :shipping_charge, :prefecture, :preparation_day

  with_options presence: true do
    validates :name, :description, :price, :user
    validates :genre_id, :condition_id, :shipping_charge_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }
  end
end
