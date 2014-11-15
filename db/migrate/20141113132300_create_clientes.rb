class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :id_cliente
      t.string :Nombre
      t.string :Direccion
      t.string :Telefono
      t.string :email

      t.timestamps
    end
  end
end
