class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
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
    @item = Item.find(params[:id])
    @category = Category.find(@item.category_id)
    @status = Status.find(@item.status_id)
    @fee_payer = FeePayer.find(@item.fee_payer_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @shopping_day = ShoppingDay.find(@item.shopping_day_id)
    @user = User.find(@item.user_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_payer_id, :prefecture_id, :shopping_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
