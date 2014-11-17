class WelcomeController < ApplicationController
  def index
  	@empleado = Empleado.find(2)
  	@nombre = @empleado.Nombre
  	@puesto = @empleado.Puesto
  end

	def cliente
		@clientes = Cliente.all
	end

end
