class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  before_save :format_email

  def format_email
    self.email = self.email.delete(' ').downcase
  end
end
