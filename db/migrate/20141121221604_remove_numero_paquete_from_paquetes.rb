class RemoveNumeroPaqueteFromPaquetes < ActiveRecord::Migration
  def change
    remove_column :paquetes, :Numero_paquete, :integer
  end
end
