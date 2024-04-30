# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :count_total

  private

  def count_total
    @total_quantity = CartItem.where(cart_id: session[:cart_id]).sum(:quantity)
  end
end
