class Product < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :category
end
