class ProveedorPaquetesController < ApplicationController
  before_action :set_proveedor_paquete, only: [:show, :edit, :update, :destroy]

  # GET /proveedor_paquetes
  # GET /proveedor_paquetes.json
  def index
    @proveedor_paquetes = ProveedorPaquete.all
  end

  # GET /proveedor_paquetes/1
  # GET /proveedor_paquetes/1.json
  def show
  end

  # GET /proveedor_paquetes/new
  def new
    @proveedor_paquete = ProveedorPaquete.new
  end

  # GET /proveedor_paquetes/1/edit
  def edit
  end

  # POST /proveedor_paquetes
  # POST /proveedor_paquetes.json
  def create
    @proveedor_paquete = ProveedorPaquete.new(proveedor_paquete_params)

    respond_to do |format|
      if @proveedor_paquete.save
        format.html { redirect_to @proveedor_paquete, notice: 'Proveedor paquete was successfully created.' }
        format.json { render :show, status: :created, location: @proveedor_paquete }
      else
        format.html { render :new }
        format.json { render json: @proveedor_paquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedor_paquetes/1
  # PATCH/PUT /proveedor_paquetes/1.json
  def update
    respond_to do |format|
      if @proveedor_paquete.update(proveedor_paquete_params)
        format.html { redirect_to @proveedor_paquete, notice: 'Proveedor paquete was successfully updated.' }
        format.json { render :show, status: :ok, location: @proveedor_paquete }
      else
        format.html { render :edit }
        format.json { render json: @proveedor_paquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedor_paquetes/1
  # DELETE /proveedor_paquetes/1.json
  def destroy
    @proveedor_paquete.destroy
    respond_to do |format|
      format.html { redirect_to proveedor_paquetes_url, notice: 'Proveedor paquete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor_paquete
      @proveedor_paquete = ProveedorPaquete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedor_paquete_params
      params.require(:proveedor_paquete).permit(:id_provedor, :id_paquete)
    end
end
