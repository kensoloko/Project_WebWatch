class SetDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :is_admin, false
    change_column_default :users, :avatar_url, "avatar_default.png"
  end
end
