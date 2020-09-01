class AddUserToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_reference :coffees, :user, null: false, foreign_key: true
  end
end
