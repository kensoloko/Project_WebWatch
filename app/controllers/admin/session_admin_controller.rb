class Admin::SessionAdminController < ApplicationController
  layout "session_admin"
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password]) && user.is_admin?
      login user
      redirect_to admin_base_products_url
    else
      flash.now[:danger] = t "sessions.create.invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to admin_login_path, flash: {success: t("admin.logout")}
  end
end
