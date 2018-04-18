class CreateBillDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_details do |t|
      t.references :product, foreign_key: true
      t.references :bill, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
