class Proveedor < ActiveRecord::Base
	belongs_to :empleados
	has_many :proveedor_paquetes
end
