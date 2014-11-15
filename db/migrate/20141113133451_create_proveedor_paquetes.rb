class CreateProveedorPaquetes < ActiveRecord::Migration
  def change
    create_table :proveedor_paquetes do |t|
      t.integer :id_provedor
      t.integer :id_paquete

      t.timestamps
    end
  end
end
