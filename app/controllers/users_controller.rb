class UsersController < ApplicationController
  before_action :load_user, only: %i(show)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    # if @user.save
    #   flash[:success] = t "uses_controller.log_in_success"
    # end
  end

  def show
  end

  private

  def load_user
    redirect_to "/", flash: {danger: t("alert.user_not_found")}\
    unless @user = User.find_by(id: params[:id])
  end
end
