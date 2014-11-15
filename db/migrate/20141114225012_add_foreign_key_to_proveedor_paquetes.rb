class AddForeignKeyToProveedorPaquetes < ActiveRecord::Migration
  def change
  end

 # execute <<-SQL
 # 	ALTER table proveedor_paquetes
 # 	ADD CONSTRAINT proveedor_paquetes_fk foreign key(id_provedor) 
 # 	references proveedors(id_provedor);
 # SQL

 # execute <<-SQL
 # 	ALTER table proveedor_paquetes
 # 	ADD CONSTRAINT proveedor_paquetes_fk foreign key(id_paquete)
 # 	references paquetes(id_paquete);
 # SQL

end
