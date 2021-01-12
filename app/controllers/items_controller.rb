class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :item_state_id, :delivery_fee_id, :prefecture_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
