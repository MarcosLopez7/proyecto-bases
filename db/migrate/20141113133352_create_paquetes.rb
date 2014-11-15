class CreatePaquetes < ActiveRecord::Migration
  def change
    create_table :paquetes do |t|
      t.integer :id_paquete
      t.integer :Numero_paquete
      t.integer :Costo
      t.text :Descripcion

      t.timestamps
    end
  end
end
