class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def show

  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
    if @product.save
        format.html { redirect_to @product, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @product }
    else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end

end
