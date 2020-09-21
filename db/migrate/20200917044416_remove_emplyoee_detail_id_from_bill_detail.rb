class RemoveEmplyoeeDetailIdFromBillDetail < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bill_details, :emplyoee_detail_id, foreign_key: true
  end
end
