class ItemsController < ApplicationController
  def index
  end

  def new
      before_action :authenticate_user!
  end

  private

   def message_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
end
