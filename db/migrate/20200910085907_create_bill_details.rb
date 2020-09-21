class CreateBillDetails < ActiveRecord::Migration[5.2]
  def change
    
    create_table :bill_details do |t|
      t.integer  :invoice_no
      t.datetime :date_of_expense
      t.string :description
      t.float :amount
      t.references :expenses
      t.binary :related_pdfs
      t.timestamps
    end
    change_column_default :bill_details, :status, nil
    # :from STATUS_CODES[0], :to STATUS_CODES[1]
  end
  # def up 
  #   remove_column :bill_detail, :emplyoee_detail_id
  # end
end
