class AddEmailToEmpleados < ActiveRecord::Migration
  def change
    add_column :empleados, :email, :string
  end
end
