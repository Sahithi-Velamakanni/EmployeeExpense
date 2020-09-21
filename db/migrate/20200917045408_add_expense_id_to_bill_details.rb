class AddExpenseIdToBillDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :bill_details, :expense_id, foreign_key: true
  end
end
