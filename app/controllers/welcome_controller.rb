class WelcomeController < ApplicationController
  def index
  	@nombre = Empleado.joins('INNER JOIN users ON users.email = empleados.email').where('empleados.email' => current_user.email)[0].Nombre
  	
  end

	def cliente
		@clientesNombre = Cliente.all
		@cliente = params[:Clientes]
		@clientes = Cliente.where('Nombre' => @cliente)
		@empleado_clientes = EmpleadoCliente.all

		if params[:commit] == "registrar"
			@EmpleadoCliente = EmpleadoCliente.new

			@EmpleadoCliente.id_cliente = Cliente.where('Nombre' => params[:Clientes])[0].id_cliente
			
			@EmpleadoCliente.id_empleado = Empleado.joins('INNER JOIN users ON users.email = empleados.email').where('empleados.email' => current_user.email)[0].id_empleado

			if @EmpleadoCliente.save
				redirect_to fiesta_path
			else
				redirect_to welcome_cliente_path
			end
		end
	end

	private

	def registrar
		
		@EmpleadoCliente = EmpleadoCliente.new
		@cliente = Cliente.where('Nombre' => params[:Clientes])[0]
		@EmpleadoCliente.id_cliente = @cliente.id_cliente
		
		@EmpleadoCliente.id_empleado = Empleado.joins('INNER JOIN users ON users.email = empleados.email').where('empleados.email' => current_user.email)[0].id_empleado

		if @EmpleadoCliente.save
			redirect_to fiesta_path
		else
			redirect_to welcome_cliente_path
		end
	end

end
