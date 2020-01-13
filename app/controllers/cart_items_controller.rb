class CartItemsController < ApplicationController


  def create
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

    private

end
