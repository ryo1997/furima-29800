class ItemsController < ApplicationController
  before_action :move_to_root, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_root
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :condition_id, :shipping_charge_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
