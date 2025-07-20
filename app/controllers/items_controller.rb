class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_payer_id, :prefecture_id, :shopping_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
