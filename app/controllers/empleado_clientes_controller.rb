class EmpleadoClientesController < ApplicationController
  before_action :set_empleado_cliente, only: [:show, :edit, :update, :destroy]

  # GET /empleado_clientes
  # GET /empleado_clientes.json
  def index
    @empleado_clientes = EmpleadoCliente.all
  end

  # GET /empleado_clientes/1
  # GET /empleado_clientes/1.json
  def show
  end

  # GET /empleado_clientes/new
  def new
    @empleado_cliente = EmpleadoCliente.new
  end

  # GET /empleado_clientes/1/edit
  def edit
  end

  # POST /empleado_clientes
  # POST /empleado_clientes.json
  def create
    @empleado_cliente = EmpleadoCliente.new(empleado_cliente_params)

    respond_to do |format|
      if @empleado_cliente.save
        format.html { redirect_to @empleado_cliente, notice: 'Empleado cliente was successfully created.' }
        format.json { render :show, status: :created, location: @empleado_cliente }
      else
        format.html { render :new }
        format.json { render json: @empleado_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleado_clientes/1
  # PATCH/PUT /empleado_clientes/1.json
  def update
    respond_to do |format|
      if @empleado_cliente.update(empleado_cliente_params)
        format.html { redirect_to @empleado_cliente, notice: 'Empleado cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @empleado_cliente }
      else
        format.html { render :edit }
        format.json { render json: @empleado_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleado_clientes/1
  # DELETE /empleado_clientes/1.json
  def destroy
    @empleado_cliente.destroy
    respond_to do |format|
      format.html { redirect_to empleado_clientes_url, notice: 'Empleado cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado_cliente
      @empleado_cliente = EmpleadoCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empleado_cliente_params
      params.require(:empleado_cliente).permit(:id_empleado, :id_cliente, :fecha, :hora)
    end
end
