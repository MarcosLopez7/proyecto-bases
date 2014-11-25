class RemovePasswordFromEmpleados < ActiveRecord::Migration
  def change
    remove_column :empleados, :password, :string
  end
end
