class Product < ApplicationRecord
  mount_uploaders :images, ProductsImageUploader
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  belongs_to :category

end
