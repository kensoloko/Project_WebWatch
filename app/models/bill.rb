class Bill < ApplicationRecord
  has_many :bill_details
  belongs_to :user
  validates :status, numericality: true
  accepts_nested_attributes_for :bill_details

  default_scope {order created_at: :desc}

  def total
    self.joins("inner join")
  end
end
