class Bill < ApplicationRecord
  belongs_to :User

  validates :status, numericality: true
end
