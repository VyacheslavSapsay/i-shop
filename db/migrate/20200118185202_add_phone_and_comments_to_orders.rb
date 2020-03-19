# frozen_string_literal: true

class AddPhoneAndCommentsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :phone, :string
    add_column :orders, :comment, :text
    add_column :orders, :email, :string
  end
end
