class CreateBillDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_details do |t|
      t.integer :emp_id
      t.integer  :invoice_no
      t.datetime :date_of_expense
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
