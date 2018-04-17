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
    @comments = @product.comments.all
    @rate = @product.rates.find_by user_id: params[:id]
    @ratetotal = @product.rates

    if @ratetotal.blank?
      @averate = t ".No_Rate"
    else
      @averate = @ratetotal.reduce(0.0){|sum, el| sum + el.rate_value} /
        @ratetotal.size
    end
  end

  def index
    @products = Product.page params[:page]

    q = params[:search]
    if q
      @products = Product.search(name_cont: q).result
    else
      @products = Product.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def rate
    @rate = @product.rates.new rate_value: params[:value],
      user_id: current_user.id
    if @rate.save
      respond_to do |format|
        format.html{render html: @rate.rate_value}
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
