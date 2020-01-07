class Category < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :product_categories
  has_many :products, through: :product_categories
  mount_uploader :image, ImageUploader
end
