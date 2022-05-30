# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, except: %i[index new create]
  before_action :find_item, only: %i[add_item delete_item]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @items = Item.all
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def add_item
    @category.items << @item
    redirect_to category_path(@category)
  end

  def delete_item
    @item = Item.find(params[:item_id])
    if @item.categories.count == 1
      flash[:notice] = "Atleast one category required for #{@item.title}"
    else
      @category.items.destroy(@item)
    end
    redirect_to category_path(@category)
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to categories_path, notice: e.message
  end
end
