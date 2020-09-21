class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :emplyoeee_details

      t.timestamps
    end
  end
end
