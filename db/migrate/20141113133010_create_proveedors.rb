class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.integer :id_provedor
      t.string :Nombre
      t.string :Direccion
      t.string :Telefono
      t.string :Producto
      t.integer :id_empleado

      t.timestamps
    end
  end
end
