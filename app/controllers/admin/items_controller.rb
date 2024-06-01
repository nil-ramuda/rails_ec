# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_authenticate
    skip_before_action :set_cart, :count_total

    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.create(item_params)
      @item.image.attach(params[:item][:image])
      if @item.save
        flash[:success] = '商品を出品しました'
        redirect_to admin_items_path
      else
        render 'new', status: :unprocessable_entity
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        flash[:success] = '商品を更新しました'
        redirect_to admin_items_path
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
      Item.find(params[:id]).destroy
      flash[:success] = '商品を削除しました'
      redirect_to admin_items_path
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, :detail, :image)
    end
  end
end
