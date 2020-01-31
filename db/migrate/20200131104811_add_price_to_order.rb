class AddPriceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :price, :decimal, default: 0
    add_column :cart_items, :price, :decimal, default: 0
  end
end
