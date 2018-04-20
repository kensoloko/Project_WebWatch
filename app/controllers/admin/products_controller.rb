class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(show)
  def index
    @products = Product.all
  end

  def show
    @product_images = @product.product_images.all
  end

  def new
    @brands = Brand.all
    @categories = Category.all
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new product_params
    # Them dieu kien if
    @product.save
    @products = Product.all
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
  end

  def product_params
    params.require(:product).permit :name, :price, :quantity,
      :description, :content, :brand_id, :category_id,
      product_images_attributes: [:image]
  end
end

