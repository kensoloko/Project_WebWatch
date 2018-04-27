class Admin::BrandsController < Admin::BaseController
  before_action :load_brand, except: %i(index new)

  def index
    @brands = Brand.all
  end

  def show; end

  def new
    @brand = Brand.new
  end

  def create
    @brands = Brand.all
    @brand = Brand.create brand_params
  end

  def edit
  end

  def update
    @brand.update_attributes brand_params
    @brands = Brand.all
  end

  def remove
    @brand = Brand.find_by id: params[:brand_id]
  end

  def destroy
    @brand.destroy
    @brands = Brand.all
  end

  def destroy_multiple
    if params[:brand_ids]
      Brand.where(id: params[:brand_ids]).destroy_all
    end
    render :index
  end

  private

  def load_brand
    @brand = Brand.find_by id: params[:id]
  end

  def brand_params
    params.require(:brand).permit :name, :description
  end
end
