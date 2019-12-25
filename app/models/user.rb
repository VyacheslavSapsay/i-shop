class User < ApplicationRecord
  authenticates_with_sorcery!
  validate :pass_val
  validates :password, presence: true,
                      length: { minimum: 8 }
  attr_accessor :password, :password_confirmation


  def pass_val
    errors.add(:password, 'must contain 1 small letter, 1 capital letter and minimum 8 symbols') if password.count('a-z') <= 0 || password.count('A-Z') <= 0
  end
end
