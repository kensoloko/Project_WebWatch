class Admin::UsersController < Admin::BrandsController
  def index
    @users = User.all
  end
end
