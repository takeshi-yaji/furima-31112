class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    item =item.find(params[:id])
    item.update(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :charges_id, :prefecture_id, :price, :day_id, :image).merge(user_id: current_user.id)
  end
end
