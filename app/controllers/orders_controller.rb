class OrdersController < ApplicationController
  before_action :set_order, only: [:create, :index]
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:create]

  def index
    @orderaddress = OrderAddress.new
  end

  def create
    @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
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

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    else @item.user_id = nil
      redirect_to root_path
    end
  end

end
