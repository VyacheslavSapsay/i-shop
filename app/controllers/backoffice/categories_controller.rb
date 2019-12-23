class Backoffice::CategoriesController < Backoffice::BackofficeController
  before_action :set_product, only: %i[show edit update destroy]
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
        format.html { redirect_to @category, url: admin_products_path, notice: 'Category was successfully created.' }
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
      flash[:notice] = 'Category has been edited'
    else
      format.html { render :edit }
    end
  end

  def show

  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin?
    unless current_user&.admin
      redirect_to root_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
