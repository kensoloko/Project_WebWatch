class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(show edit update destroy)
  before_action :load_products, only: %i(index create)
  before_action :load_combo_box, only: %i(new edit)
  after_action :load_products, only: %i(update destroy)

  def index; end

  def show
    @product_images = @product.product_images.all
  end

  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new product_params
    if params[:product_images].present?
      if @product.save(product_params)
        params[:product_images]["image"].each do |a|
          @product_image = @product.product_images.create!(:image =>a)
        end
        flash.now[:success] = t "admin.flash.create"
      end
    else
      flash.now[:error] = t "admin.flash.create_fail"
    end
  end

  def edit
  end

  def update
      if @product.update(product_params)
        i = 0
        params[:product_images]["image"].each do |a|
          @product_image = @product.product_images[i].update_attributes(:image => a)
          i+=1
        end if params[:product_images].present?

        flash[:success] = t "update_success"
        redirect_to admin_products_path

      else
        render :edit
      end

  end

  def remove
    @product = Product.find_by id: params[:product_id]
  end

  def destroy
    @product.destroy
    flash.now[:success] = t "admin.flash.delete"
    load_products
    if @products.nil?
      redirect_to admin_products_path
    end
  end

  def delete_multiple
    if params[:product_ids].present?
      @selected_products = Product.where(id: params[:product_ids])
      result = check_valid_delete_mutiple_action @selected_products

      if result[0] == 0
        selected_products_string = " "
        @selected_products.each do |selected_product|
          selected_products_string += (selected_product.name + " , ")
          selected_product.destroy
        end

      else
        result[3].each {|x| x.destroy} if result[3].present?
        flash[:info] = result[4] + "have been deleted successfully" +
          " But , some of the products can not be delete like : " + result[2] +
           " because they contains some infomation in bill details "
      end
    else
      flash[:warning] = t "nothing_delete"
    end
    redirect_to admin_products_path
  end

  def check_valid_delete_mutiple_action products
    result = []
    invalid_products = []
    invalid_products_string = ""
    valid_products = []
    valid_products_string = ""
    flag = 0

    products.each do |product|
      if product.bill_details.present?
        flag = 1
        invalid_products.push(product)
      else
        valid_products.push(product)
      end
    end

    invalid_products.each {|x| invalid_products_string += (x.name + " , ")} if
      invalid_products.present?

    valid_products.each {|x| valid_products_string += (x.name + " , ")} if
      valid_products.present?

    result.push(flag)
    result.push(invalid_products)
    result.push(invalid_products_string)
    result.push(valid_products)
    result.push(valid_products_string)

    result
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
      product_images_attributes: [:id, :product_id, :image]
  end
end
