class AddReferenceToModel < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :commentable 
  end
end
