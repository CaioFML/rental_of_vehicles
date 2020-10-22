class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :plate
      t.string :name
      t.integer :year
      t.integer :manufacturing_year

      t.timestamps
    end
  end
end
