class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i(edit update destroy)
  before_action :load_categories, only: %i(index create update)
  after_action :load_categories, only: %i(create update destroy)

  def index; end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params
  end

  def edit; end

  def update
    @category.update_attributes category_params
  end

  def remove
    @category = Category.find_by id: params[:category_id]
  end

  def destroy
    @category.destroy
    if @categories.nil?
      redirect_to admin_categories_path
    end
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
  end

  def load_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
