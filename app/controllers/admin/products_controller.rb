class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(show edit update remove)
  def index
    @products = Product.all
  end

  def show
    @product_images = @product.product_images.all
  end

  def new
    @list_brands = Brand.all.map { |list| [list.name, list.id] }
    @list_categories = Category.all.map { |list| [list.name, list.id] }
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @products = Product.all
    @product = Product.new product_params
    if @product.save
    end
  end

  def edit
   # @brands = Brand.all
    @list_brands = Brand.all.map { |list| [list.name, list.id] }
    # @categories = Category.all
    @list_categories = Category.all.map { |list| [list.name, list.id] }
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    load_products
  end

  def remove
    @product = Product.find_by id: params[:product_id]
  end

  def destroy
    @product.destroy
    @products = Product.all
  end
  private
  def load_product
    @product = Product.find_by id: params[:id]
  end
  def load_products
    @products = Product.all
  end
  def product_params
    params.require(:product).permit :name, :price, :quantity,
      :description, :content, :brand_id, :category_id,
      product_images_attributes: [:image]
  end
end
