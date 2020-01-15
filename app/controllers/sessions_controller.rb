class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      create_or_set_cart
      flash[:success] = 'Logged in!'
      if user.admin?
        create_or_set_cart
        redirect_to admin_products_path
      else
        redirect_to root_path
      end
    else
      flash[:danger] = 'Email or password is invalid'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:warning] = 'Logged out!'
  end
end
