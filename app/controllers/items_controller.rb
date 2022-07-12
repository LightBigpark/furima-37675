class ItemsController < ApplicationController
  def index
  end

  def new
      before_action :authenticate_user!
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
end
