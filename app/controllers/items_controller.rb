class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
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