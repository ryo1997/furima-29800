class BuyerManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  VALID_PHONE_REGEX = /\A\d{11}\z/.freeze
  validates :phone_number, format: { with: VALID_PHONE_REGEX }

  def save
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(purchaser_id: purchaser.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
