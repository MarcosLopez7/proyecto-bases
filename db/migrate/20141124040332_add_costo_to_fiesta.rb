class AddCostoToFiesta < ActiveRecord::Migration
  def change
    add_column :fiesta, :costo, :decimal
  end
end
