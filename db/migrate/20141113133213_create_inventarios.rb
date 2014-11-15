class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.integer :id_inventario
      t.string :Producto
      t.integer :Cantidad
      t.integer :id_empleado

      t.timestamps

    end
  end
end
