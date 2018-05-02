class BillDetail < ApplicationRecord
  belongs_to :product
  belongs_to :bill
  validates :quantity, presence: true, numericality: true

  scope :total_money,
    -> {joins(:product).sum("products.price * bill_details.quantity")}

  scope :day_money, -> s, f do
    s = Date.today.beginning_of_month if s.blank?
    f = Date.today.end_of_month if f.blank?
    joins(:product).where("bill_details.created_at between ? and ?",s,f)
    .group("date(bill_details.created_at)")
    .select("bill_details.id, date(bill_details.created_at) as 'day',
      sum(products.price * bill_details.quantity) as 'money',
      count(*) as 'count'")
  end
end
