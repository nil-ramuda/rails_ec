# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :item_ids

  def new
    @cart_item = @cart.cart_items.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @latest_item = Item.last
    @cart_item = @cart.cart_items.find_or_initialize_by(item_id: params[:id])
  end

  private

  def item_ids
    @item_ids = @cart.cart_items.pluck(:item_id)
  end
end
