class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(checkout new create)
  before_action :correct_user, only: %i(edit update show)
  before_action :load_user, except: %i(checkout new index create)

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
      redirect_to @user, flash: {success: t(".profile_updated")}
    else
      flash[:danger] = t ".update_fail"
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :address, :avatar_url
  end

  def load_user
    unless @user = User.find_by(id: params[:id])
      redirect_to root_url
      flash[:danger] = t ".user_not_found"
    end
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
      flash[:danger] = t ".please_login"
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url, flash: {danger: t(".access_denied")}
    if @user != current_user
  end
end
