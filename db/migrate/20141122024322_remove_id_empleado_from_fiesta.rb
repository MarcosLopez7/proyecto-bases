class RemoveIdEmpleadoFromFiesta < ActiveRecord::Migration
  def change
    remove_column :fiesta, :id_empleado, :integer
  end
end
