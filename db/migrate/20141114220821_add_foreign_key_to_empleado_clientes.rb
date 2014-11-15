class AddForeignKeyToEmpleadoClientes < ActiveRecord::Migration
  def change
  end

#  execute <<-SQL
#  	ALTER TABLE empleado_clientes
#  	ADD CONSTRAINT empleado_clientes_fk FOREIGN KEY (id_empleado)
#  	REFERENCES empleados(id_empleado)
#  SQL

#  execute <<-SQL
#  	ALTER TABLE empleado_clientes
#  	ADD CONSTRAINT empleado_clientes_fk FOREIGN KEY (id_cliente)
#  	REFERENCES clientes(id_cliente)
#  SQL

end
