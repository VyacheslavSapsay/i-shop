class Cart < ApplicationRecord
  has_many :cartitems, dependent: :destroy
end
