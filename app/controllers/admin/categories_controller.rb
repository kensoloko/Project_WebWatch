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
    flash.now[:success] = t "admin.flash.delete"
    load_categories
    if @categories.nil?
      redirect_to admin_categories_path
    end
  end

  def delete_multiple
    if params[:category_ids].present?
      @selected_categories = Category.where(id: params[:category_ids])
      result = check_valid_delete_mutiple_action @selected_categories

      if result[0] == 0
        @selected_categories.each do |selected_category|
          selected_category.destroy
        end
        flash[:success] = t "success_delete"
      else
        flash[:error] = t("admin.categories.multi_delete_message1") + result[2] +
          t("admin.categories.multi_delete_message2")
      end
    else
      flash[:warning] = t "nothing_delete"
    end
    redirect_to admin_categories_path
  end

  def check_valid_delete_mutiple_action categories
    result = []
    invalid_categories = []
    invalid_categories_string = ""
    f = 0

    categories.each do |category|
      if category.check_valid_delete_action[0] == 1
        f = 1
        invalid_categories.push(category)
      end
    end

    invalid_categories.each do |invalid_category|
      invalid_categories_string += (invalid_category.name + " ")
    end

    result.push(f)
    result.push(invalid_categories)
    result.push(invalid_categories_string)
    return result
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
