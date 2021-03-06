class User < ApplicationRecord
  mount_uploader :avatar_url, ImageUploader
  has_many :bills
  has_many :comments
  has_many :rates
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :email_downcase
  validates :name, presence: true, length: {maximum: Settings.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :phone, presence: true,
    length: {maximum: Settings.phone_max_length}
  validates :address, presence: true

  private

  def email_downcase
    email.downcase!
  end
end
