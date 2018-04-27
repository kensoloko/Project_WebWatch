class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :categories, through: :products
  validates :name, presence: true, length: {maximum: Settings.max_length},
    uniqueness: true
  validates :description, presence: true
  default_scope {order created_at: :desc}
end
