class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_login
  before_action :ensure_admin_user

  def products
    @products = Product.all
  end

  def brands
    @brands = Brand.all
  end

  def ratings
  end

  def categories
    @categories = Category.all
  end

  def home
  end

  def comments
  end

  def users
    @users = User.all
  end

  private

  def check_login
    redirect_to admin_login_url unless logged_in?
  end

  def ensure_admin_user
    unless current_user and current_user.is_admin?
      redirect_to root_path, flash: {danger: t("sessions.create.invalid")}
    end
  end
end

