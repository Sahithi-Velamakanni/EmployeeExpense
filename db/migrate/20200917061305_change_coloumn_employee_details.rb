class ChangeColoumnEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :expenses, :emplyoeee_details_id, :emplyoee_detail_id 
  end
end
