class CreatePaqueteInventarios < ActiveRecord::Migration
  def change
    create_table :paquete_inventarios do |t|
      t.integer :id_inventario
      t.integer :id_paquete

      t.timestamps
    end
  end
end
