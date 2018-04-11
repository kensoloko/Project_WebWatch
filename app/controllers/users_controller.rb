class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update show)
  before_action :load_user, except: %i(new index create)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      login @user
      flash[:success] = t ".create_success"
      redirect_to @user
    else
      flash.now[:danger] = t ".create_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      redirect_to @user, flash: {success: t("alert.profile_updated")}
    else
      flash[:danger] = t "alert.update_fail"
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :email, :password,
      :password_confirmation, :phone, :address, :avatar_url
  end

  def load_user
    redirect_to root_url, flash: {danger: t(".user_not_found")}\
    unless @user = User.find_by(id: params[:id])
  end

  def logged_in_user
    redirect_to login_url, flash: {danger: t(".please_login")} unless logged_in?
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url, flash: {danger: t(".access_denied")}\
    if @user != current_user
  end
end
