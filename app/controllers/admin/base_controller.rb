class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_login, only: :index
  before_action :check_admin

  def index
    @data_chart = data_chart
  end

  private

  def check_login
    unless logged_in?
      redirect_to admin_login_url
    end
  end

  def check_admin
    unless current_user && current_user.is_admin?
      flash[:warning] = t "sessions.create.invalid"
      redirect_to root_path
    end
  end

  def data_chart
    if params[:index]
      BillDetail.day_money params[:index][:start], params[:index][:finish]
    else
      BillDetail.day_money false, false
    end
  end
end
