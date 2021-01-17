class OrdersController < ApplicationController
  
  def index
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end


  def create
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])

  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @order.price,
          card: order_params[:token],
          currency: 'jpy'
        )
  end

end
