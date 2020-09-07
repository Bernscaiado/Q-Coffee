class AddAdressToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :address, :string
  end
end
