class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.integer :gender
      t.datetime :birth_date

      t.timestamps
    end
  end
end
