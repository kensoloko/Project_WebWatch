class Brand < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.max_length}
  validates :description, presence: true
end
