class CreateEmplyoeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :emplyoee_details do |t|
      t.integer :emp_id
      t.string :department
      t.string :emp_name
      t.string :status

      t.timestamps
    end
  end
end
