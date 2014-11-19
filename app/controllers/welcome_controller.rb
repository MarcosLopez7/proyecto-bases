class WelcomeController < ApplicationController
  def index
  	@empleado = Empleado.find(2)
  	@nombre = @empleado.Nombre
  	@puesto = @empleado.Puesto
  end

	def cliente
		@clientesNombre = Cliente.all
		@cliente = params[:Clientes]
		@clientes = Cliente.where('Nombre' => @cliente)
		@empleado_clientes = EmpleadoCliente.all

		if params[:commit] == "registrar"
			@EmpleadoCliente = EmpleadoCliente.new
			@cliente = Cliente.where('Nombre' => params[:Clientes])
			@cliente.each do |cli|
				@EmpleadoCliente.id_cliente = cli.id_cliente
			end
			@EmpleadoCliente.id_empleado = 3
			@EmpleadoCliente.fecha = Date.current.to_s
			@EmpleadoCliente.hora = String.try_convert(Time.current.to_s)[11..18]

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
		@cliente = Cliente.where('Nombre' => params[:Clientes])
		@cliente.each do |cli|
			@EmpleadoCliente.id_cliente = @cliente.id_cliente
		end
		@EmpleadoCliente.id_empleado = 1
		@EmpleadoCliente.fecha = Date.current.to_s
		@EmpleadoCliente.hora = String.try_convert(Time.current.to_s)[11..18]

		if @EmpleadoCliente.save
			redirect_to fiesta_path
		else
			redirect_to welcome_cliente_path
		end
	end

end
