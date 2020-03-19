# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.order(:title)
  end

  def show
    @products = Product.all
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
