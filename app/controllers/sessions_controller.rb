class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user.admin?
      create_or_set_cart
      redirect_to admin_products_path
    elsif user
      create_or_set_cart
      redirect_back_or_to root_path
      flash[:success] = 'Logged in!'
    else
      flash.now[:danger] = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:warning] = 'Logged out!'
  end
end
