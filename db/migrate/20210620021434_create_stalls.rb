class CreateStalls < ActiveRecord::Migration[6.1]
  def change
    create_table :stalls do |t|
      t.string :stall_name

      t.timestamps
    end
  end
end
