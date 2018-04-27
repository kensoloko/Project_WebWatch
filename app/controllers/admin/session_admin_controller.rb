class Admin::SessionAdminController < ApplicationController
  layout "session_admin"

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password]) && user.is_admin?
      login user
      redirect_to admin_url
    else
      flash.now[:error] = t "sessions.create.invalid"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t "admin.logout"
    redirect_to admin_login_path
  end
end
