# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'cheapest'
                  Product.all.cheapest.paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'expensive'
                  Product.all.expensive.paginate(page: params[:page], per_page: 20)
                else
                  Product.all.paginate(page: params[:page], per_page: 20)
            end
    @random_product = @products.sample
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end
end
