class ProductsController < ApplicationController
  before_action :load_product, only: %i(show rate)
  before_action :rate_total, only: %i(show rate)

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
    when "new"
      @products = Product.news.page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    when "hot"
      @products = Product.hots.page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def rate
    @rate = @product.rates.new rate_value: params[:value],
      user_id: current_user.id
    if @rate.save
      respond_to do |format|
        format.html{render html: rate_total}
        format.js
      end
    end
  end

  private

  def load_product
    unless @product = Product.find_by(id: params[:id])
      flash[:danger] = t ".product_not_found"
      redirect_to root_url
    end
  end

  def rate_total
    @ratetotal = @product.rates
    if @ratetotal.blank?
      @averate = 0
    else
      @averate = @ratetotal.reduce(0.0){|s, e| s + e.rate_value} /
        @ratetotal.size
    end
    @averate
  end
end
