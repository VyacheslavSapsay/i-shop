class Cart < ApplicationRecord
  has_many :cartitems, dependent: :destroy
  belongs_to :user
end
