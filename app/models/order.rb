# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :address, :phone, :email, presence: true
  has_many :cart_items, dependent: :destroy
  after_create :send_confirmation
  after_update :send_status

  scope :new_order, -> { where(status: 'new') }
  scope :in_progress, -> { where(status: 'in progress') }
  scope :completed, -> { where(status: 'completed') }
  scope :cancelled, -> { where(status: 'cancelled') }

  STATUS_TYPES = ['new', 'in progress', 'completed', 'cancelled'].freeze

  def send_confirmation
    OrderMailer.confirmation(self).deliver!
  end

  def send_status
    OrderMailer.status(self).deliver!
  end
end
