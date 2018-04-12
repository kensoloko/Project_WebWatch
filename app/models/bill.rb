class Bill < ApplicationRecord
  has_many :bill_details
  belongs_to :User
  validates :status, numericality: true
end
