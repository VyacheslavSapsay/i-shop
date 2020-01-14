class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]
  before_action :set_cart
  def create
    if @cart.cart_items.find_by(product_id: params[:product_id]).present?
      @cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
      @cart_item.update(quantity: @cart_item.quantity += 1)
      flash[:success] = "Item added"
      redirect_back(fallback_location: root_path)
    else
      @cart_item = CartItem.create(cart_id: current_user.cart.id, product_id: params[:product_id])
      flash[:success] = "Item added"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_cart
    @cart = Cart.find_by_user_id(current_user.id)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
