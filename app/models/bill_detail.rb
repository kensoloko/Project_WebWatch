class BillDetail < ApplicationRecord
  has_one :bill
  has_one :product
  belongs_to :Product
  belongs_to :Bill
  validates :quantity, pesence: true, numericality: true
end
