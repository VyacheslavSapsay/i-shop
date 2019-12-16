class Category < ApplicationRecord
  validates :title, uniqueness: true
  has_many :products
end
