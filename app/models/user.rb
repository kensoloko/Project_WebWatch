class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /(09|01[2|6|8|9])+([0-9]{8})\b/i

  before_save :email_downcase

  validates :username, presence: true, length: {maximum: Settings.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :phone, presence: true,
    length: {maximum: Settings.phone_max_length},
    format: {with: VALID_PHONE_REGEX}, uniqueness: true
  validates :address, presence: true

  private

  def email_downcase
    email.downcase!
  end
end
