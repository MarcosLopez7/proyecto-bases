class AddCostoToProveedors < ActiveRecord::Migration
  def change
    add_column :proveedors, :costo, :integer
  end
end
