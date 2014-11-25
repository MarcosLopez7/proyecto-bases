class AddPasswordToEmpleado < ActiveRecord::Migration
  def change
    add_column :empleados, :password, :string
  end
end
