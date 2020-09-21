class ColoumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bill_details, :expense_id_id, :expense_id
  end
end
