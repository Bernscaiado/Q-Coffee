class AddStoreToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :store, :string
  end
end
