class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_login, only: :index
  before_action :check_admin

<<<<<<< HEAD
  def home
  end

  private
  def ensure_admin_user
=======
  def products
    @products = Product.all
  end

  def index; end

  private

  def check_login
    unless logged_in?
      redirect_to admin_login_url
    end
  end

  def check_admin
>>>>>>> a51795e761bc24911acbc532cd0078d1bd676c69
    unless current_user and current_user.is_admin?
      flash[:danger] = t "sessions.create.invalid"
      redirect_to root_path
    end
  end
end

