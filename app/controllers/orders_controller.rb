class OrdersController < ApplicationController
  before_action :set_item, only: [:create, :index]
  before_action :authenticate_user!

  def index
    @orderaddress = OrderAddress.new
     if current_user.id == @item.user_id
       redirect_to root_path
     elsif @item.order.present?
       redirect_to root_path
     else
      render 'index'
     end
  end

  def create
    @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      redirect_to root_path
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


  def set_item
    @item = Item.find(params[:item_id])
  end

end
