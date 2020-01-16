class CartItemsController < ApplicationController

  def create
    if current_user
      if current_user.cart.cart_items.find_by(product_id: params[:product_id]).present?
        @cart_item = current_user.cart.cart_items.find_by(product_id: params[:product_id])
        @cart_item.update(quantity: @cart_item.quantity += 1)
        flash[:success] = "Item added"
        redirect_back(fallback_location: root_path)
      else
        @cart_item = CartItem.create(cart_id: current_user.cart.id, product_id: params[:product_id])
        flash[:success] = "Item added"
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Plz Log in or registration"
    end
  end

  def destroy
    current_user.cart.cart_items.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

end
