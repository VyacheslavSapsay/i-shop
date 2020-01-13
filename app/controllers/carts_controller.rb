class CartsController < ApplicationController
  before_action :set_cart
def show
  @cart_items = CartItem.all.where(cart_id: @cart.id)
end


def set_cart
  @cart = Cart.find_by_user_id(current_user.id)
end
end
