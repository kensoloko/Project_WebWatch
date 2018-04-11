class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :phone
      t.text :address
      t.string :avatar_url
      t.boolean :is_admin

      t.timestamps
    end
  end
end
