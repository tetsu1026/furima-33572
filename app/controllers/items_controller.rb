class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
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

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :item_state_id, :delivery_fee_id, :prefecture_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
