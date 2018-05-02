class Bill < ApplicationRecord
  has_many :bill_details
  belongs_to :user
  validates :status, numericality: true
  accepts_nested_attributes_for :bill_details

  default_scope {order :status, created_at: :desc}

  scope :status, ->num{where status: num if num.present? }
  scope :time, ->time do
    case time
    when "1"
      all
    when "2"
      finish = Date.today.end_of_month
      start = Date.today.beginning_of_month
      where("created_at >= ? and created_at <= ?",start,finish)
    when "3"
      finish = Date.today.end_of_month
      start = 6.month.ago
      where("created_at >= ? and created_at <= ?",start,finish)
    when "4"
      finish = Date.today.end_of_year
      start = Date.today.beginning_of_year
      where("created_at >= ? and created_at <= ?",start,finish)
    else
      limit(5)
    end
  end

end
