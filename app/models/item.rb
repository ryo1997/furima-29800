class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :condition, :shipping_charge, :prefecture, :preparation_day

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :user
    validates :genre_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :preparation_day_id
  end

  with_options numericality: { other_than: 1 } true do
    validates :genre_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
