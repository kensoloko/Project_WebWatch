class ProductsController < ApplicationController
  before_action :load_product, only: %i(show rate)

  def products
    @product = Product.new
    @category = Category.new
    @brand = Brand.new
  end

  def show
    @category = Category.find_by id: @product.category_id
    @brand = Brand.find_by id: @product.brand_id
<<<<<<< HEAD
=======
    @comments = @product.comments
    @rate = @product.rates.find_by user_id: params[:id]
    @ratetotal = @product.rates

    if @ratetotal.blank?
      @averate = t ".No_Rate"
    else
      @averate = @ratetotal.reduce(0.0){|sum, el| sum + el.rate_value} /
        @ratetotal.size
    end
>>>>>>> f44c4447e214350999326ef08cc3c279be08666b
  end

  def index
    @products = Product.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

<<<<<<< HEAD
  def fillter
    case params[:status]
    when 'new'
      @products = Product.order(updated_at: :desc).page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    when 'hot'
      @products = Product.joins("inner join bill_details on products.id =
        bill_details.product_id").select('products.id, name, price, image,
        description, count(bill_details.id) as "count"')
      .group('products.id, bill_details.product_id').order("count desc")
      .page params[:page]
      respond_to do |format|
        format.html
=======
  def rate
    @rate = @product.rates.new rate_value: params[:value],
      user_id: current_user.id
    if @rate.save
      respond_to do |format|
        format.html{render html: @rate.rate_value}
>>>>>>> f44c4447e214350999326ef08cc3c279be08666b
        format.js
      end
    end
  end

  private

  def load_product
    redirect_to root_url, flash: {danger: t(".product_not_found")}\
    unless @product = Product.find_by(id: params[:id])
  end
end
