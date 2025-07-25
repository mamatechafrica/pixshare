class AddCommentableToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :bigint
    add_index :comments, [:commentable_type, :commentable_id]

  end
end
