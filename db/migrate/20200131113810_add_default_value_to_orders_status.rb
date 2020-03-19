# frozen_string_literal: true

class AddDefaultValueToOrdersStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, :string, default: 'new'
  end
end
