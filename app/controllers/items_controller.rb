class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render 'index'
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name,:explain,:category_id,:condition_id,:delivery_id,:area_id,:shipping_date_id,:price).merge(user_id:current_user.id)
  end

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end