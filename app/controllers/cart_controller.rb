class CartController < ApplicationController
  def new
    @cart = Cart.new
  end
end
