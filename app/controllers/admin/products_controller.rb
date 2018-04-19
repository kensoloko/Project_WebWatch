class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(show)
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @brands = Brand.all
    @categories = Category.all
    @product = Product.new
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
  end
end
