class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rate_value

      t.timestamps
    end
  end
end
