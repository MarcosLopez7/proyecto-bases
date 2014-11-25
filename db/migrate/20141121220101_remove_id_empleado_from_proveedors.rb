class RemoveIdEmpleadoFromProveedors < ActiveRecord::Migration
  def change
    remove_column :proveedors, :id_empleado, :integer
  end
end
