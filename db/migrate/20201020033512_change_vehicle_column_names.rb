class ChangeVehicleColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicles, :name, :model_name
    rename_column :vehicles, :manufacturing_year, :manufacture_year
    rename_column :vehicles, :year, :model_year
  end
end
