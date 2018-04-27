class ProductImage < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :product
end
