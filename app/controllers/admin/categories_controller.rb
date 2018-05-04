class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i(edit update destroy)
  before_action :load_categories, only: %i(index create update delete_multiple)
  after_action :load_categories, only: %i(create update destroy delete_multiple)

  def index; end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params

    if @category.save
      flash.now[:success] = t "admin.flash.create"
    else
      flash.now[:warning] = t "admin.flash.create_fail"
    end
  end

  def edit; end

  def update
    @category.update_attributes category_params

    if @category.save
      flash.now[:success] = t "admin.flash.update"
    else
      flash.now[:dangeer] = t "admin.flash.update_fail"
    end
  end

  def remove
    @category = Category.find_by id: params[:category_id]
  end

  def destroy
    @category.destroy
    load_categories
    flash.now[:success] = t "admin.flash.delete"

    if @categories.nil?
      redirect_to admin_categories_path
    end
  end

  def delete_multiple
    if params[:category_ids].present?
      @selected_categories = Category.where(id: params[:category_ids])
      @selected_categories.each do |selected_categorie|
        selected_categorie.destroy
      end
    else
      flash[:warning] = "nothing_delete"
    end
    redirect_to admin_categories_path
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
