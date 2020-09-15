class CreateEmplyoeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :emplyoee_details do |t|
      t.string :department
      t.string :name
      t.string :status
      t.string :email_id

      t.timestamps
    end
  end
end
