class AddStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :bill_details, :status, :string
  end
end
