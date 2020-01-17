class AddProductsRefToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :product, null: true, foreign_key: false
  end
end
