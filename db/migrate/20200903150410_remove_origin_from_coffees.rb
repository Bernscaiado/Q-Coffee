class RemoveOriginFromCoffees < ActiveRecord::Migration[6.0]
  def change
    remove_column :coffees, :origin, :string
  end
end
