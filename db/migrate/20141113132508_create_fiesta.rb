class CreateFiesta < ActiveRecord::Migration
  def change
    create_table :fiesta do |t|
      t.integer :id_fiesta
      t.date :fecha
      t.integer :id_cliente
      t.integer :id_empleado
      t.integer :id_paquete

      t.timestamps
    end
  end
end
