class ProductsController < ApplicationController
  before_action :load_product, only: %i(show rate)

  def show
    save_product @product
  end

  def index
    @products = Product.includes(:product_images)
      .references(:product_images).page params[:page]
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

  def search
    @products = Product.ransack(name_cont: params[:q])
      .result(distinct: true)
    @brands = Brand.ransack(name_cont: params[:q])
      .result(distinct: true)
    respond_to do |format|
      format.html{

      }
      format.json{
        @products = @products.limit(5)
        @brands = @brands.limit(5)
      }
    end
  end

  private
  def load_product
    unless @product = Product.find_by(id: params[:id])
      flash[:warning] = t "product_not_found"
      redirect_to root_url
    end
  end
end
