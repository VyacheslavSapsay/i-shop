class Backoffice::ProductsController < Backoffice::BackofficeController

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def new

  end

  def create

  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
  end

  def show
    @product = Product.find(params[:id])
  end
end
