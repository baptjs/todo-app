class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many :todos

  before_save :format_email

  def format_email
    self.email = self.email.delete(' ').downcase
  end

  def self.find_user_by(value)
    where(email: value).first
  end

  def send_login_link
    generate_login_token

    # template = 'login_link'
    UserMailer.send_login_link(self).deliver_now
  end

  def generate_login_token
    self.token = generate_token
    self.token_generated_at = Time.now.utc
    save!
  end

  def login_link
    # "http://localhost:3000/auth/#{self.id}?token=#{self.token}"
    "https://todo-app-31032022.herokuapp.com/auth/#{self.id}?token=#{self.token}"
    
  end

  def login_token_expired?
    Time.now.utc > (self.token_generated_at + token_validity)
  end

  def expire_token!
    self.token = nil
    save!
  end

  def valid_token?(token)
    self.token == token
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def token_validity
    2.hours
  end
end
