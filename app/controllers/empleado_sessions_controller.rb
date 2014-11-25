class EmpleadoSessionsController < ApplicationController
	def new
		
	end
	def create
		user = login(params[:username], params[:password])
		if user
			redirect_back_or_to(welcome_index_path, message: "Bienvenido")
		else
			flash.now[:alert] = "Usuario invalido"
			render action: :new
		end
	end
	def destroy
			logout
			rendirect_to(empleado_sessions_new_path, message: "Sesion cerrada")
	end
end