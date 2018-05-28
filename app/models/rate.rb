class Rate < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :user_id, uniqueness: {scope: :product_id}
  default_scope{order created_at: :desc}
end

