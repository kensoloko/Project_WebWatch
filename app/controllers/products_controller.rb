class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def products
    @product = Product.new
    @category = Category.new
    @brand = Brand.new
  end

  def show
    @category = Category.find_by id: @product.Category_id
    @brand = Brand.find_by id: @product.Brand_id
    @comments = @product.comments.all
  end

  def index
    @products = Product.page params[:page]
  end

  private

  def load_product
    redirect_to root_url, flash: {danger: t(".product_not_found")}\
    unless @product = Product.find_by(id: params[:id])
  end
end
