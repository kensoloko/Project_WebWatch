class BillDetail < ApplicationRecord
  belongs_to :Product
  belongs_to :Bill
end
