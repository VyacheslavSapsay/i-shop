# frozen_string_literal: true

module ProductsHelper
  def average_product_rating(product)
    if product.comments.count > 0
      (product.comments&.sum(:rating).to_f / product.comments&.count).round(1)
    else
      'No rating'
    end
  end
end
