class OrdersController < ApplicationController
  before_action :buy_item, only: [ :index, :create ]
  def index
    @buyermanagement = BuyerManagement.new
  end

  def create
    @buyermanagement = BuyerManagement.new(buyer_params)
    if @buyermanagement.valid?
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
end

