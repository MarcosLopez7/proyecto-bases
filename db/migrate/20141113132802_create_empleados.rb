class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.integer :id_empleado
      t.string :Nombre
      t.string :Direccion
      t.string :Telefono
      t.string :Puesto

      t.timestamps
    end
  end
end
