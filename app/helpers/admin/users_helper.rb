module Admin::UsersHelper
  def fetch_user_name id
    @user = User.find_by id: id
    if @user.nil?
    return t("admin.no_info")
    else
      return @user.name
    end
  end
end
