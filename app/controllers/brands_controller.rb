class BrandsController < ApplicationController
  before_action :load_brand, only: %i(show edit update destroy)
  def brands
    @brand = Brand.new
  end

  def new
    @brand = Brand.new
  end

  # def create
  #   @brands = Brand.all
  #   @brand = Brand.create(brand_params)
  # end

  # def edit
  #   @brand = Brand.find_by id: params[:id]
  # end

  # def update
  #   @brands = Brand.all
  #   @brand = Brand.find_by id: params[:id]

  #   @brand.update_attributes(brand_params)
  # end

  # def delete
  #   @brand = Brand.find_by id: params[:id]
  # end

  # def destroy
  #   @brands = Brand.all
  #   @brand = Brand.find_by id: params[:id]
  #   @brand.destroy
  # end

  # private

  # def load_brand
  #   @brand = Brand.find_by id: params[:id]
  # end

  # def brand_params
  #   params.require(:brand).permit(:name, :description)
  # end
end
