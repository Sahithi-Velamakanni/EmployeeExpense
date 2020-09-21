class AddEmailIdToEmplyoeeDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :emplyoee_details, :email_id, :string
  end
end
