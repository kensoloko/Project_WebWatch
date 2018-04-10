class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    # if @user.save
    #   flash[:success] = t "uses_controller.log_in_success"
    # end
  end
end
