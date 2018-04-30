class ProductsController < ApplicationController
  before_action :load_product, only: %i(show rate)

  def show; end

  def index
    @products = Product.includes(:product_images).references(:product_images).page params[:page]
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
        format.html{render html: @product.averate}
        format.js
      end
    else
      respond_to do |format|
        format.html{render html: "false"}
      end
    end
  end

  private
  def load_product
    unless @product = Product.find_by(id: params[:id])
      flash[:warning] = t ".product_not_found"
      redirect_to root_url
    end
  end
end
