# frozen_string_literal: true

class Backoffice::OrdersController < Backoffice::BackofficeController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :admin?

  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 8)
  end

  def edit; end

  def update
    if @order.update_attributes(order_params)
      redirect_to admin: @order
      flash[:success] = 'Order has been updated'
    else
      format.html { render :edit }
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def admin?
    redirect_to root_path unless current_user&.admin
  end

    private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :comment)
  end
  end
