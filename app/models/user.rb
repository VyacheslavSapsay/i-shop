class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation
end
