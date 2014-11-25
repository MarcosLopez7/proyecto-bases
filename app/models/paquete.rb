class Paquete < ActiveRecord::Base
	has_many :proveedor_paquetes
	has_many :fiesta
	has_many :paquete_inventarios
	validates :id_paquete, numericality: {only_integer: true}
	validates :Descripcion, presence: true 
	validates :id_paquete, presence: true 
end
