class CreateEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_details do |t|
      t.string :emp_name
      t.string :emp_department
      t.string :status

      t.timestamps
    end
  end
end
