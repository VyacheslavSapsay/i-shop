class CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
  end
  def create
  @cart_item = current_user.cart.cart_items.new(cart_item_params)
      if @cart_item.save!
        redirect_to @cart
        flash[:success] = 'Product added'
      else
        redirect_to @cart
        flash[:danger] = @cart.errors.full_messages.first
    end
end
end
