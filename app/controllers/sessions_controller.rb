class SessionsController < ApplicationController
  before_action :check_login, only: :new
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:success] = t ".login"
      redirect_back fallback_location: user
    else
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t ".logout"
    redirect_to root_url
  end

  private

  def check_login
    redirect_to current_user if logged_in?
  end
end
