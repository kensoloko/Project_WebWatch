class Product < ApplicationRecord
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bill_details
  belongs_to :category
  belongs_to :brand

  validates :name, presence: true,
    length: {maximum: Settings.max_length}, uniqueness: true
  validates :price, :quantity, presence: true, numericality: true
  validates :content, :description, :image, presence: true
end
