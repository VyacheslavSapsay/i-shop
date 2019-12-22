class Product < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  belongs_to :category

  def self.search(search)
  where('title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
