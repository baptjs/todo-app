class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  before_save :format_email

  def format_email
    self.email = self.email.delete(' ').downcase
  end

  def self.find_user_by(value)
    where(email: value).first
  end
end
