class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :brands, through: :products
  validates :name, presence: true, length: {maximum: Settings.max_length},
    uniqueness: true
  validates :description, presence: true

  default_scope {order created_at: :desc}

  def delete_warning_text
    warning_text = ""
    if self.products.present?
      warning_text = "This category has some products .
        Delete this also remove all its products . Are you sure "
    end
    return warning_text;
  end
end
