class Rate < ApplicationRecord
  belongs_to :Product
  belongs_to :User

  validates :rate_value, presence: true, numericality: true,
    inclusion: {in: 1..5}
end
