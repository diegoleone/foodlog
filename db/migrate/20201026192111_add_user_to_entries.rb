class AddUserToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :user_id, :int
  end
end
