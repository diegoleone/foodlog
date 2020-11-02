class User < ApplicationRecord
  before_save { self.user_email = user_email.downcase }
  has_many :entries
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
