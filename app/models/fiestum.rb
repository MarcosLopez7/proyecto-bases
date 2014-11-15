class Fiestum < ActiveRecord::Base
	belongs_to :clientes
	belongs_to :empleados
	belongs_to :paquetes
end
