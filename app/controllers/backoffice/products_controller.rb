class Backoffice::ProductsController < Backoffice::BackofficeController

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        flash[:success] = 'Post was successfully created.'
        format.html { redirect_to @product, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @product }
    else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
