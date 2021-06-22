class CreateRotations < ActiveRecord::Migration[6.1]
  def change
    create_table :rotations do |t|
      t.datetime :begins_at
      t.datetime :ends_at
      t.boolean :head
      t.references :branch_Office, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :stall, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
