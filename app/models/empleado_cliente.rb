class EmpleadoCliente < ActiveRecord::Base
	belogs_to :empleados
	belogs_to :clientes
end
