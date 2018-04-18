class BillDetail < ApplicationRecord
  belongs_to :product
  belongs_to :bill
  validates :quantity, presence: true, numericality: true
end
