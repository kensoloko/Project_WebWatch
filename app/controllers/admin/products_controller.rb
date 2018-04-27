class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(show edit update destroy)
  before_action :load_products only: %i(index create)
  before_action :load_combo_box, only: %i(new edit)
  after_action :load_products, only: %i(update destroy)

  def index
    @products = Product.all
  end

  def show
    @product_images = @product.product_images.all
  end

  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new product_params
    @product.save
  end

  def edit; end

  def update

    if @product.update_attributes product_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
  end

  def remove
    @product = Product.find_by id: params[:product_id]
  end

  def destroy
    @product.destroy
    if @products.nil?
      redirect_to admin_products_path
    end
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
  end

  def load_products
    @products = Product.all
  end

  def load_combo_box
    @list_brands = Brand.all.map {|list| [list.name, list.id]}
    @list_categories = Category.all.map {|list| [list.name, list.id]}
  end

  def product_params
    params.require(:product).permit :name, :price, :quantity,
      :description, :content, :brand_id, :category_id,
      product_images_attributes: [:image]
  end
end
