class Cliente < ActiveRecord::Base
	has_many :fiesta
	has_many :empleado_clientes
end
