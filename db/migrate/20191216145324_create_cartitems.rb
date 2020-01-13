class CreateCartitems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|

      t.timestamps
    end
  end
end
