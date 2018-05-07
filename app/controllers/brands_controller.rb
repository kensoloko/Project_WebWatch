class BrandsController < ApplicationController
  before_action :load_brand, only: :show

  def index
    @brands = Brand.all
  end

  def show
    @products = @brand.products.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def load_brand
    unless @brand = Brand.find_by(id: params[:id])
      flash[:warning] = t "brand_not_found"
      redirect_to root_url
    end
  end
end