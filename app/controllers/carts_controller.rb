class CartsController < ApplicationController
  
  def show
    if current_user
      @cart_items = current_user.cart.cart_items
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def plus_quantity
    @cart_item = CartItem.find(params[:cart_item])
    @cart_item.update(quantity: @cart_item.quantity += 1)
    redirect_back(fallback_location: root_path)
  end

  def minus_quantity
    @cart_item = CartItem.find(params[:cart_item])
    if @cart_item.quantity <= 0
      redirect_back(fallback_location: root_path)
    else
      @cart_item.update(quantity: @cart_item.quantity -= 1)
      redirect_back(fallback_location: root_path)
    end
  end

end
