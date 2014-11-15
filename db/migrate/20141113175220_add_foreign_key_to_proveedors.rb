class AddForeignKeyToProveedors < ActiveRecord::Migration
  def change
  	#add_index :proveedors, :id_empleado
  end

#  execute <<-SQL
#  	ALTER TABLE proveedors 
#  	ADD CONSTRAINT proveedors_fk FOREIGN KEY (id_empleado)
#  	REFERENCES empleados(id_empleado) 
#  SQL

end
