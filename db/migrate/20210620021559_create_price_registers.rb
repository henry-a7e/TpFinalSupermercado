class CreatePriceRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :price_registers do |t|
      t.float :price
      t.datetime :begin_at
      t.datetime :ends_at
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
