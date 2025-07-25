class AddParentIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :parent_id, :integer
  end
end
