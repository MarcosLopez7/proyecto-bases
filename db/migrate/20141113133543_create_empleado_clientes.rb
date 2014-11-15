class CreateEmpleadoClientes < ActiveRecord::Migration
  def change
    create_table :empleado_clientes do |t|
      t.integer :id_empleado
      t.integer :id_cliente
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
