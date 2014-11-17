class EmpleadoCliente < ActiveRecord::Base
	belongs_to :empleados
	belongs_to :clientes
end
