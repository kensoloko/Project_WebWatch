class BrandsController < ApplicationController
  def brands
    @brand = Brand.new
  end
end
