class RemoveDetailsFromEmpleadoClientes < ActiveRecord::Migration
  def change
    remove_column :empleado_clientes, :fecha, :date
    remove_column :empleado_clientes, :hora, :time
  end
end
