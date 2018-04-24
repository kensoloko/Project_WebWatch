class Product < ApplicationRecord
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bill_details
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  belongs_to :category
  belongs_to :brand
  default_scope {order created_at: :desc}

  validates :name, presence: true,
    length: {maximum: Settings.max_length}, uniqueness: true
  validates :price, :quantity, presence: true, numericality: true
  validates :content, :description, presence: true
  accepts_nested_attributes_for :product_images
  def averate
    rates = self.rates

    if rates.blank?
      averate = 0
    else
      averate = rates.reduce(0.0){|s, e| s + e.rate_value} / rates.size
    end
    averate
  end

  def first_image
    if self.product_images.first.nil?
      img = "s-1.jpg"
    else
      img = self.product_images.first.image
    end
    img
  end

  def sold_out?
    if self.quantity <= 0
      true
    else
      false
    end
  end

  class << self
    def news
      Product.order updated_at: :desc
    end

    def hots
      Product.joins("inner join bill_details on products.id =
        bill_details.product_id").select('products.id, name, price,
        description, count(bill_details.id) as "count"')
        .group("products.id, bill_details.product_id").order("count desc")
    end
  end
end
