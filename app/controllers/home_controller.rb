# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  def index
    @items = Item.new
    @item = Item.all
  end
end
