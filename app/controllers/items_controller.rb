class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]

  def index
  end

  def new
      @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:items).permit(:image, :items_name,:explain,:category_id,:condition_id,:delivery_id,:area_id,:date_id,:price,:users)
  end

  def message_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
