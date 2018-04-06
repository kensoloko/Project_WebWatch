class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :Product, foreign_key: true
      t.references :User, foreign_key: true
      t.integer :rate_value

      t.timestamps
    end
  end
end
