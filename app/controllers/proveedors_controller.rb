class ProveedorsController < ApplicationController
  before_action :set_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /proveedors
  # GET /proveedors.json
  def index
    @proveedors = Proveedor.all
  end

  # GET /proveedors/1
  # GET /proveedors/1.json
  def show
  end

  # GET /proveedors/new
  def new
    @proveedor = Proveedor.new
  end

  # GET /proveedors/1/edit
  def edit
  end

  # POST /proveedors
  # POST /proveedors.json
  def create
    
    @proveedor = Proveedor.new(proveedor_params)
    respond_to do |format|
      if @proveedor.save
        @proveedor.id_provedor = @proveedor.id
        @proveedor.save
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully created.' }
        format.json { render :show, status: :created, location: @proveedor }
      else
        format.html { render :new }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedors/1
  # PATCH/PUT /proveedors/1.json
  def update
    @paquetes = Paquete.joins('INNER JOIN proveedor_paquetes ON paquete.id_paquete = proveedor_paquetes.id_paquete').where('paquete_inventarios.id_provedor' => @proveedor.id_provedor)
      
        @paquetes.each do |paquete|
          paquete.Costo -=  @proveedor.costo
          paquete.save
        end
    respond_to do |format|
      if @proveedor.update(proveedor_params)
        @paquetes.each do |paquete|
          paquete.Costo +=  @proveedor.costo
          paquete.save
        end
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @proveedor }
      else
        format.html { render :edit }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedors/1
  # DELETE /proveedors/1.json
  def destroy
    @pi = ProveedorPaquete.where('id_provedor' => @proveedor.id_provedor)

    @pi.each do |pi|
      pi.destroy
    end
    @proveedor.destroy
    respond_to do |format|
      format.html { redirect_to proveedors_url, notice: 'Proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedor_params
      params.require(:proveedor).permit(:id_provedor, :Nombre, :Direccion, :Telefono, :Producto, :costo)
    end
end
