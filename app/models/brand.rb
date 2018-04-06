class Brand < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true
end
