class ItemsController < ApplicationController
  before_action :move_to_root, only: [:new]

  def index
  end

  def new
  end

  private
  def move_to_root
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def items_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
end

