class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user, flash: {success: t(".login")}
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, flash: {success: t(".logout")}
  end
end
