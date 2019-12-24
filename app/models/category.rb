class Category < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :products
  mount_uploader :image, ImageUploader
end
