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
      flash[:success] = t "create_success"
      redirect_to @user
    else
      flash.now[:error] = t "create_fail"
      render :new
    end
  end

  def show
    @bills = @user.bills_order
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_updated"
    else
      flash[:warning] = t ".update_fail"
    end
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :address, :avatar_url
  end

  def load_user
    unless @user = User.find_by(id: params[:id])
      flash[:warning] = t ".user_not_found"
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:warning] = t ".please_login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    if @user != current_user
      flash[:warning] = t ".access_denied"
      redirect_to root_url
    end
  end
end
