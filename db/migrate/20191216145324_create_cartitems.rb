# frozen_string_literal: true

class CreateCartitems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items, &:timestamps
  end
end
