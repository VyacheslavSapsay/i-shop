# frozen_string_literal: true

class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
