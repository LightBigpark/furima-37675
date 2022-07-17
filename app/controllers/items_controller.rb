class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.where(id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name,:explain,:category_id,:condition_id,:delivery_id,:area_id,:shipping_date_id,:price).merge(user_id:current_user.id)
  end

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end


end