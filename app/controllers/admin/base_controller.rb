class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_login, only: :index
  before_action :check_admin

  def index; end

  private

  def check_login
    unless logged_in?
      redirect_to admin_login_url
    end
  end

  def check_admin
    unless current_user and current_user.is_admin?
      flash[:danger] = t "sessions.create.invalid"
      redirect_to root_path
    end
  end
end

