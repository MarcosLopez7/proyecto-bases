class Empleado < ActiveRecord::Base
	has_many :fiesta
	has_many :inventarios
	has_many :proveedors
	has_many :empleado_clientes
end
