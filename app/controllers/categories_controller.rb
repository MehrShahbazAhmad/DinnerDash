# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, except: %i[index new create]
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
    if @category.id?
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
