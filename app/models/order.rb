class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  after_create :send_confirmation


  def send_confirmation
    OrderMailer.confirmation(self).deliver!
  end
  
end
