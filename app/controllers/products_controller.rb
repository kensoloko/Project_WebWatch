class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def products
    @product = Product.new
    @category = Category.new
    @brand = Brand.new
  end

  def show
    @category = Category.find_by id: @product.category_id
    @brand = Brand.find_by id: @product.brand_id
  end

  def index
    @products = Product.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def fillter
    case params[:status]
    when 'new'
      @products = Product.order(updated_at: :desc).page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    when 'hot'
      @products = Product\
      .joins("inner join bill_details on products.id = bill_details.product_id")
      .select('products.id, name, price, image, description, count(bill_details.id) as "count"')\
      .group('products.id, bill_details.product_id').order("count desc")\
      .page params[:page]
    end
  end

  private

  def load_product
    redirect_to root_url, flash: {danger: t(".product_not_found")}\
    unless @product = Product.find_by(id: params[:id])
  end
end
