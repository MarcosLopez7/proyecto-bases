class RemoveIdEmpleadoFromInventaios < ActiveRecord::Migration
  def change
    remove_column :inventarios, :id_empleado, :integer
  end
end
