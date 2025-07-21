class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_if_not_owner, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(@item.category_id)
    @status = Status.find(@item.status_id)
    @fee_payer = FeePayer.find(@item.fee_payer_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @shopping_day = ShoppingDay.find(@item.shopping_day_id)
    @user = User.find(@item.user_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_owner
    redirect_to root_path if current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_payer_id, :prefecture_id, :shopping_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
