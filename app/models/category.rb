class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :brands, through: :products
  validates :name, presence: true, length: {maximum: Settings.max_length}
  validates :description, presence: true

  default_scope {order created_at: :desc}
end
