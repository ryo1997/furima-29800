class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  has_one_attached :image

  belongs_to :user
  has_one :purchaser

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
    validates :image
  end

  validates :genre_id, :condition_id, :shipping_charge_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/ } 

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end


