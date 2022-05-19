class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find_by_id(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params()
    params.require(:item).permit(:title, :description, :price, :status, images: [])
  end
end
