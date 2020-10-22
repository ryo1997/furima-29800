class BuyerManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  end

  def save
    # 出品者の情報を保存
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    #purchaser.id
    # 住所の情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number )#purchaser.user_id: purchaser.user_id
  end
end