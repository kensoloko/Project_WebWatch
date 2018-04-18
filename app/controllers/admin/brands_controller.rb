class Admin::BrandsController < Admin::BaseController
  before_action :load_brand, only: %i(show edit update destroy)

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by id: params[:id]
  end

  def new
    @brand = Brand.new
  end

  def create
    @brands = Brand.all
    @brand = Brand.create(brand_params)
  end

  def edit
    @brand = Brand.find_by id: params[:id]
  end

  def update
    @brand = Brand.find_by id: params[:id]
    @brand.update_attributes(brand_params)
    @brands = Brand.all
  end

  def remove
    @brand = Brand.find_by id: params[:brand_id]
  end

  def destroy
    @brand = Brand.find_by id: params[:id]
    @brand.destroy
    @brands = Brand.all
  end

  private

  def load_brand
    @brand = Brand.find_by id: params[:id]
  end

  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
