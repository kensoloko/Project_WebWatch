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
    if @brands.nil?
      redirect_to admin_brands_path
    end
  end

  def delete_multiple
    if params[:brand_ids].present?
      @selected_brands = Brand.where(id: params[:brand_ids])
      result = check_valid_delete_mutiple_action @selected_brands

      if result[0] == 0
        @selected_brands.each do |selected_brand|
          selected_brand.destroy
        end
        flash[:success] = "Success to delete these records"
      else
        flash[:error] = "Unable to delete these brands because " + result[2] +
          "has some products belong to bill details . "
      end
    else
      flash[:warning] = "Nothing to delete"
    end
    redirect_to admin_brands_path
  end

  def check_valid_delete_mutiple_action brands
    result = []
    invalid_brands = []
    invalid_brands_string = ""
    f = 0

    brands.each do |brand|
      if brand.check_valid_delete_action[0] == 1
        f = 1
        invalid_brands.push(brand)
      end
    end

    invalid_brands.each do |invalid_brand|
      invalid_brands_string += (invalid_brand.name + " ")
    end

    result.push(f)
    result.push(invalid_brands)
    result.push(invalid_brands_string)
    return result
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
