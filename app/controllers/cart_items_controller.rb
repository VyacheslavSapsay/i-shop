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
      #cart_items = []
      #cart_items.push(params[:product_id])
      #cookies[:cart_items] = cart_items
      cookies[:cart_items] = '' if cookies[:cart_items].nil?
      cookies[:cart_items] = cookies[:cart_items] + "#{params[:product_id]} ,"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.cart.cart_items.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

end
