class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def show

  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end

end
