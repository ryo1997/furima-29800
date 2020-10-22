class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_item, only: [ :index, :create ]
  def index
    if current_user == @item.user || @item.purchaser.present?
      return redirect_to root_path
    else
    @buyermanagement = BuyerManagement.new
    end
  end

  def create
    @buyermanagement = BuyerManagement.new(buyer_params)
    if @buyermanagement.valid?
      pay_item
      @buyermanagement.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_item
    @item = Item.find(params[ :item_id ])
  end

  def buyer_params
    params.require(:buyer_management).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number ).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

