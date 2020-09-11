class AddLocationToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :location, :string
  end
end
