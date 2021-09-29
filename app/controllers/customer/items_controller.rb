class Customer::ItemsController < ApplicationController
  include ApplicationHelper

  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def about
  end

  def top
    @items = Item.all
  end

end