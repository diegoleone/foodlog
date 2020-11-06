class User < ApplicationRecord
  before_save { self.user_email = user_email.downcase }
  has_many :entries
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  before_create :set_confirmation_token

  def confirm!
    self.email_confirmed = true
    self.confirm_token = nil
    save(validate: false) # Saves user bypassing validates
  end

  private
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
