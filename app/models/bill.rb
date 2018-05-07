class Bill < ApplicationRecord
  has_many :bill_details
  belongs_to :user
  accepts_nested_attributes_for :bill_details
  validates :status, numericality: true
  default_scope{order :status, created_at: :desc}
  scope :status, ->num{where status: num if num.present?}
  scope :time, ->time do
    case time
    when "1"
      all
    when "2"
      finish = Date.today.end_of_month
      start = Date.today.beginning_of_month
      where("created_at >= ? and created_at <= ?", start, finish)
    when "3"
      finish = Date.today.end_of_month
      start = 6.months.ago
      where("created_at >= ? and created_at <= ?", start, finish)
    when "4"
      finish = Date.today.end_of_year
      start = Date.today.beginning_of_year
      where("created_at >= ? and created_at <= ?", start, finish)
    else
      limit(5)
    end
  end
  scope :today, -> do
    where("created_at between ? and ?",
      Date.today.beginning_of_day,
      Date.today.end_of_day).count("*")
  end
  scope :spending_desc, -> do
    joins(bill_details: :product)
      .where("bills.status = 4 and bills.created_at between ? and ?",
        1.month.ago.beginning_of_month,
        1.month.ago.end_of_month)
      .select("user_id, sum(products.price * bill_details.quantity) as 'money',
        count(distinct bills.id) as 'count'").group :user_id
  end
  scope :tops, -> do
    unscoped.spending_desc.joins(:user).order("money desc")
      .select("users.*").limit(5)
  end
  scope :status_statistics_last, -> do
    group(:status).where("bills.created_at between ? and ?",
      1.month.ago.beginning_of_month,
      1.month.ago.end_of_month).count("*")
  end
  scope :status_statistics_now, -> do
    group(:status).where("bills.created_at between ? and ?",
      Date.today.beginning_of_month,
      Date.today.end_of_month).count("*")
  end

  def total_price
    total = 0
    self.bill_details.each do |bill_detail|
      total += (bill_detail.product.price * bill_detail.quantity)
    end
    total
  end
end
