class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  after_create :send_confirmation
  after_update :send_status

  STATUS_TYPES = ['new', 'in progress', 'completed', 'cancelled']

  def send_confirmation
    OrderMailer.confirmation(self).deliver!
  end

  def send_status
    OrderMailer.status(self).deliver!
  end

end
