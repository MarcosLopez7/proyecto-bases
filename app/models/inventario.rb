class Inventario < ActiveRecord::Base
	has_many :paquete_inventarios
	validates :Cantidad, numericality: {only_integer: true}
	validates :Producto, presence: true 
	validates :Cantidad, presence: true 
end
