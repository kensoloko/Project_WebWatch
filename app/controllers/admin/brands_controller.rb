class Admin::BrandsController < Admin::BaseController
  before_action :load_brand, only: %i(edit update destroy)
  before_action :load_brands, only: %i(index create update delete_multiple)
  after_action :load_brands, only: %i(create update destroy delete_multiple)

  def index; end

  def show; end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create brand_params
    if @brand.save
      flash.now[:success] = t "admin.flash.create"
    else
      flash.now[:warning] = t "admin.flash.create_fail"
    end
  end

  def edit
  end

  def update
    @brand.update_attributes brand_params
    if @brand.save
      flash.now[:success] = t "admin.flash.update"
    else
      flash.now[:dangeer] = t "admin.flash.update_fail"
    end
  end

  def remove
    @brand = Brand.find_by id: params[:brand_id]
  end

  def destroy
    @brand.destroy
    load_brands
    flash.now[:success] = t "admin.flash.delete"
  end

  def delete_multiple
    if params[:brand_ids].present?
      @selected_brands = Brand.where(id: params[:brand_ids])
      result = check_valid_delete_mutiple_action @selected_brands

      if result[0] == 0
        @selected_brands.each(&:destroy)
        selected_brands_string = " "
        @selected_brands.each {|x| selected_brands_string += (x.name + " , ")}
        flash[:success] = t("success_delete") + selected_brands_string
      else
        result[3].each {|x| x.destroy} if result[3].present?
        flash[:info] = result[4] + "have been deleted successfully" + " But
           , some of the brands can not be delete like : " +
           result[2] + " because they contains some products in bill details "
      end
    else
      flash[:warning] = t "nothing_delete"
    end
    redirect_to admin_brands_path
  end

  def check_valid_delete_mutiple_action brands
    result = []
    invalid_brands = []
    invalid_brands_string = ""
    valid_brands = []
    valid_brands_string = ""
    f = 0

    brands.each do |brand|
      if brand.check_valid_delete_action[0] == 1
        invalid_brands.push(brand)
        f = 1
      else
        valid_brands.push(brand)
      end
    end

    invalid_brands.each {|x| invalid_brands_string += (x.name + " , ")} if
      invalid_brands.present?

    valid_brands.each {|x| valid_brands_string += (x.name + " , ")} if
      valid_brands.present?

    result.push(f)
    result.push(invalid_brands)
    result.push(invalid_brands_string)
    result.push(valid_brands)
    result.push(valid_brands_string)

    result
  end

  private

  def load_brand
    @brand = Brand.find_by id: params[:id]
  end

  def load_brands
    @brands = Brand.all
  end

  def brand_params
    params.require(:brand).permit :name, :description
  end
end
