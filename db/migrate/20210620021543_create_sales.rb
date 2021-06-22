class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.float :discount
      t.float :total_amount
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
