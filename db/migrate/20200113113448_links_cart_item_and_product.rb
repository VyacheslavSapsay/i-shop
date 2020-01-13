class LinksCartItemAndProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_items, :product, null: false, foreign_key: true
    add_reference :carts, :user, null: false, foreign_key: true
    add_reference :cart_items, :cart, null: false, foreign_key: true
  end
end
