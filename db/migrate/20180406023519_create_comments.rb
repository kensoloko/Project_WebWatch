class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
    add_index :comments, [:product_id, :user_id], name: "comments_product_user"
  end
end
