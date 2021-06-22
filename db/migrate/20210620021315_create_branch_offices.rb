class CreateBranchOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_offices do |t|
      t.string :address

      t.timestamps
    end
  end
end
