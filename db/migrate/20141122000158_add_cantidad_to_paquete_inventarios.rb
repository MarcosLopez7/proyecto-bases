class AddCantidadToPaqueteInventarios < ActiveRecord::Migration
  def change
    add_column :paquete_inventarios, :cantidad, :integer
  end
end
