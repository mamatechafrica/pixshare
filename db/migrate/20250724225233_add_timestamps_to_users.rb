class AddTimestampsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_timestamps :users, null: true  # avoid conflict with existing rows
  end
end
