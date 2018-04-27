class Admin::BrandsController < Admin::BaseController
  before_action :load_brand, only: %i(edit update destroy)
  before_action :load_brands, only: %i(index create update)
  after_action :load_brands, only: %i(create update destroy)
  def index; end

  def show; end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create brand_params
    flash.now[:success] = t "admin.flash.create"
    # if @brand.save
    #   flash.now[:success] = t "admin.flash.create"
    # else
    #   flash.now[:warning] = t "admin.flash.create_fail"
    # end
  end

  def edit
  end

  def update
    @brand.update_attributes brand_params
    # if @brand.save
    #   flash.now[:success] = t "admin.flash.update"
    # else
    #   flash.now[:dangeer] = t "admin.flash.update_fail"
    # end
  end

  def remove
    @brand = Brand.find_by id: params[:brand_id]
  end

  def destroy
    @brand.destroy
    if @brands.nil?
      redirect_to admin_brands_path
    end
  end

  def destroy_multiple
    # if params[:brand_ids]
    #   Brand.where(id: params[:brand_ids]).destroy_all
    # end
    # render :index
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
