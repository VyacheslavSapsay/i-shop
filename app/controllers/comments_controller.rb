class CommentsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy new]
  before_action :set_product, only: %i[new create destroy]
  #before_action :banned?, only: %i[new create]

  def correct_user
    redirect_to root_path(current_user) unless current_user
  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    if @product.comments.find_by(user_id: current_user.id)
      redirect_back(fallback_location: root_path)
    else
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id
        if @comment.save
          redirect_to @product
          flash[:success] = 'Comment was successfully created.'
        else
          redirect_to @product
          flash[:danger] = @comment.errors.full_messages.first
      end
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to @product
      flash[:warning] = "Comments deleted"
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rating, :user_id)
  end

  def set_product
    @product = Product.friendly.find params[:product_id]
  end

end
