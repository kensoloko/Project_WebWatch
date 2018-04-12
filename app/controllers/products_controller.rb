class ProductsController < ApplicationController
  def products
    @product = Product.new
    @category = Category.new
    @brand = Brand.new
  end

  def show
    @product = Product.first
    @category = Category.first
    @brand = Brand.first
  end
end
