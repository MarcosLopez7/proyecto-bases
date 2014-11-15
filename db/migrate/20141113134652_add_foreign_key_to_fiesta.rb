class AddForeignKeyToFiesta < ActiveRecord::Migration
  def change
  	#add_index :fiesta, :id_cliente, :id_empleado, :id_paquete
  end

  execute <<-SQL
  	ALTER TABLE fiesta 
  	ADD CONSTRAINT fiesta_fk FOREIGN KEY (id_cliente)
  	REFERENCES clientes(id_cliente)

  SQL

  execute <<-SQL
  	ALTER TABLE fiesta
  	ADD CONSTRAINT fiesta_fk FOREIGN KEY (id_empleado)
  	REFERENCES empleados(id_empleado)

  SQL

  execute <<-SQL
  	ALTER TABLE fiesta
  	ADD CONSTRAINT fiesta_fk FOREIGN KEY (id_paquete)
  	REFERENCES paquetes(id_paquete)
  SQL

end
