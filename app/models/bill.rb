class Bill < ApplicationRecord
  has_many :bill_details
  belongs_to :user
  validates :status, numericality: true
end
