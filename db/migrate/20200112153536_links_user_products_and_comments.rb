class LinksUserProductsAndComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user
    add_reference :comments, :product
  end
end
