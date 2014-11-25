class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  		
  		if @user = login(params[:email], params[:password])
  			redirect_back_or_to(welcome_index_path, notice: 'Login successful')
  		else
  			flash.now[:alert] = 'Usuario invalido'
        render action: 'new'
  		end
  end

  def destroy
  		logout
  		redirect_to(welcome_salida_path 'Sesion terminada')
  end
end
