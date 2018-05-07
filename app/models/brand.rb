class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :categories, through: :products
  validates :name, presence: true, length: {maximum: Settings.max_length},
    uniqueness: true
  validates :description, presence: true
  default_scope {order created_at: :desc}

  def delete_warning_text
    warning_txt = ""
    warning_txt = I18n.t "admin.brands.warning_text"
  end

  def check_valid_delete_action
    result = []
    flag = 0
    invalid_products = []
    invalid_products_string = ""

    check_products = self.products
    if check_products.present?
      check_products.each do |check_product|
        if check_product.bill_details.present?
          flag = 1
          invalid_products.push(check_product)
        end
      end

      invalid_products.each do |invalid_product|
        invalid_products_string += (invalid_product.name + " ")
      end

      result.push(flag)
      result.push(invalid_products)
      result.push(invalid_products_string)
    else
      result.push(flag)
    end
      result
  end
end
