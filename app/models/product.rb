class Product < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  belongs_to :category

end
