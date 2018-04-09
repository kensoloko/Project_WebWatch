class Product < ApplicationRecord
  belongs_to :Category
  belongs_to :Brand

  validates :product_name, presence: true,
    length: {maximum: Settings.max_length}, uniqueness: true
  validates :price, :quantity, presence: true, numericality: true
  validates :content, :description, :image, presence: true
end
