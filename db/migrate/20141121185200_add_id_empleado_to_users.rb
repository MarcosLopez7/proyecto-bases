class AddIdEmpleadoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :id_empleado, :integer
  end
end
