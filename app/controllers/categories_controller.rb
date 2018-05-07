class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def load_category
    unless @category = Category.find_by(id: params[:id])
      flash[:warning] = t "category_not_found"
      redirect_to root_url
    end
  end
end
