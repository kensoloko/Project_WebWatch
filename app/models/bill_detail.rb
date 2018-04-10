class BillDetail < ApplicationRecord
  belongs_to :Product
  belongs_to :Bill

  validates :quantity, pesence: true, numericality: true
end
