class AddCoordinatesToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :latitude, :float
    add_column :coffees, :longitude, :float
  end
end
