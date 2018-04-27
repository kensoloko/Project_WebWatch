class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, except: %i(index new)

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params
    @categories = Category.all
  end

  def edit; end

  def update
    @category.update_attributes category_params
    @categories = Category.all
  end

  def remove
    @category = Category.find_by id: params[:category_id]
  end

  def destroy
    @category.destroy
    @categories = Category.all
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
