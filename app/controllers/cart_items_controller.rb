class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]
  def create
    if CartItem.find_by(product_id: params[:product_id]).present?
      @cart_item = CartItem.find_by(product_id: params[:product_id])
      @cart_item.quantity += 1
      redirect_back(fallback_location: root_path)
    else
      @cart_item =  CartItem.new
      @cart_item.cart_id = current_user.cart.id
      @cart_item.product_id = params[:product_id]
      if @cart_item.save
        redirect_back(fallback_location: root_path)
        flash[:success] = "item added"
      else
        redirect_back(fallback_location: root_path)
        flash[:danger] = @cart_item.errors.full_messages.first
      end
    end
  end

  def destroy
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
