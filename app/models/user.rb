class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token

  validates :email, presence: true, uniqueness: true

  def increment_number
    self.number = self.number + 1
    save
  end

  def reset_number(number)
    if User.valid_number?(number)
      self.number = number
      save
    end
  end

  def self.valid_number?(number)
    number >= 0
  end
end
