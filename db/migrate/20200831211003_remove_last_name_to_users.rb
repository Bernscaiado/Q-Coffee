class RemoveLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_name, :string
  end
end
