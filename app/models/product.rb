class Product < ApplicationRecord
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bill_details
  belongs_to :category
  belongs_to :brand

  validates :name, presence: true,
    length: {maximum: Settings.max_length}, uniqueness: true
  validates :price, :quantity, presence: true, numericality: true
  validates :content, :description, :image, presence: true

  class << self
    def news
      Product.order updated_at: :desc
    end

    def hots
      Product.joins("inner join bill_details on products.id =
        bill_details.product_id").select('products.id, name, price, image,
        description, count(bill_details.id) as "count"')
        .group("products.id, bill_details.product_id").order("count desc")
    end
  end
end
