class OrdersController < ApplicationController
  def index
    @orderaddress = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @orderaddress = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @orderaddress.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :area_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
