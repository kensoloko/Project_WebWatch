class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :ensure_admin_user

  def home
  end

  private
  def ensure_admin_user
    unless current_user and current_user.is_admin?
      redirect_to root_path, flash: {danger: t("sessions.create.invalid")}
    end
  end
end

