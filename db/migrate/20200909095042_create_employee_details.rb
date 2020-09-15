class CreateEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_details do |t|
      t.string :name
      t.string :department
      t.string :status

      t.timestamps
    end
  end
end
