class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :price
      t.integer :quantity
      t.text :description
      t.text :image
      t.text :content
      t.references :Category, foreign_key: true
      t.references :Brand, foreign_key: true

      t.timestamps
    end
  end
end
