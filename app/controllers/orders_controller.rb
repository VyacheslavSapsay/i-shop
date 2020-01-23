class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.cart_items = current_user.cart.cart_items
    clear_cart(current_user.cart)
    @order.user_id = current_user.id
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def clear_cart(cart)
      cart.cart_items.each do |item|
        item.cart_id = nil
    end
  end

  private


  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :phone, :email)
  end
end
