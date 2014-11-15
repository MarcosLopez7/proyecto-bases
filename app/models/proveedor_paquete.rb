class ProveedorPaquete < ActiveRecord::Base
	belongs_to :proveedors
	belongs_to :paquetes
end
