# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @latest_item = Item.last
    # @cart_item = CartItem.new
  end
end
