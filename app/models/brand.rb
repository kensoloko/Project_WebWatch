class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :categories, through: :products
  validates :name, presence: true, length: {maximum: Settings.max_length}
  validates :description, presence: true
end
