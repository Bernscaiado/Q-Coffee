class AddTasteToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :taste, :string
    add_reference :coffees, :origin, null: false, foreign_key: true
  end
end
