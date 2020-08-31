class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :origin
      t.string :farm
      t.string :brand
      t.string :sensory
      t.string :roast

      t.timestamps
    end
  end
end
