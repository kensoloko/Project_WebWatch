class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :Product, foreign_key: true
      t.references :User, foreign_key: true
      t.text :content

      t.timestamps
    end
    add_index :comments, [:product_id, :user_id], name: "comments_product_user"
  end
end
