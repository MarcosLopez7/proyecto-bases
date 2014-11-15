class AddForeignKeyToInventarios < ActiveRecord::Migration
  def change
  	#add_index :inventarios, :id_empleado
  end

  execute <<-SQL
  	ALTER TABLE inventarios 
  	ADD CONSTRAINT inventario_fk FOREIGN KEY (id_empleado)
  	REFERENCES empleados(id_empleado)
  SQL

end
