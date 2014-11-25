class RemoveIdEmpleadoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :id_empleado, :integer
  end
end
