class Backoffice::CategoriesController < Backoffice::BackofficeController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :admin?

  def index
    @categories = Category.order(:title)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
    if @category.save
        flash[:success] = 'Category was successfully created.'
        format.html { redirect_to @category, url: admin_products_path }
        format.json { render :show, status: :created, location: @category }
    else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin: @category
      flash[:success] = 'Category has been edited'
    else
      format.html { render :edit }
    end
  end

  def edit

  end

  def destroy
    @category.destroy
    respond_to do |format|
      flash[:warning] = 'Category was successfully destroyed.'
      format.html { redirect_to admin_products_path }
      format.json { head :no_content }
    end
  end

  def choose_category
    @categories = Category.order(:title)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description, :image)
  end
end
