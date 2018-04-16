class Admin::BaseController < ApplicationController
  layout "admin"

  def index
    if logged_in?
      render :home
    else
      redirect_to admin_login_url
    end
  end
end
