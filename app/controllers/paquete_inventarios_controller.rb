class PaqueteInventariosController < ApplicationController
  before_action :set_paquete_inventario, only: [:show, :edit, :update, :destroy]

  # GET /paquete_inventarios
  # GET /paquete_inventarios.json
  def index
    @paquete_inventarios = PaqueteInventario.all
  end

  # GET /paquete_inventarios/1
  # GET /paquete_inventarios/1.json
  def show
  end

  # GET /paquete_inventarios/new
  def new
    @paquete_inventario = PaqueteInventario.new
  end

  # GET /paquete_inventarios/1/edit
  def edit
  end

  # POST /paquete_inventarios
  # POST /paquete_inventarios.json
  def create
    @paquete_inventario = PaqueteInventario.new(paquete_inventario_params)

    respond_to do |format|
      if @paquete_inventario.save
        @paquete = Paquete.joins('INNER JOIN paquete_inventarios ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @paquete_inventario.id_paquete)[0]
        @inventario = Inventario.joins('INNER JOIN paquete_inventarios ON inventarios.id_inventario = paquete_inventarios.id_inventario').where('inventarios.id_inventario' => @paquete_inventario.id_inventario)[0]
        @paquete.Costo += @inventario.costo_por_elemento * @paquete_inventario.cantidad
        
        @paquete.save
        format.html { redirect_to @paquete_inventario, notice: 'Paquete inventario was successfully created.' }
        format.json { render :show, status: :created, location: @paquete_inventario }
      else
        format.html { render :new }
        format.json { render json: @paquete_inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paquete_inventarios/1
  # PATCH/PUT /paquete_inventarios/1.json
  def update
    respond_to do |format|
      if @paquete_inventario.update(paquete_inventario_params)
        format.html { redirect_to @paquete_inventario, notice: 'Paquete inventario was successfully updated.' }
        format.json { render :show, status: :ok, location: @paquete_inventario }
      else
        format.html { render :edit }
        format.json { render json: @paquete_inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paquete_inventarios/1
  # DELETE /paquete_inventarios/1.json
  def destroy
    @paquete = Paquete.joins('INNER JOIN paquete_inventarios ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @paquete_inventario.id_paquete)[0]
    @inventario = Inventario.joins('INNER JOIN paquete_inventarios ON inventarios.id_inventario = paquete_inventarios.id_inventario').where('inventarios.id_inventario' => @paquete_inventario.id_inventario)[0]
    @paquete.Costo -= @inventario.costo_por_elemento * @paquete_inventario.cantidad
    @paquete.save
    @paquete_inventario.destroy
    respond_to do |format|
      format.html { redirect_to paquete_inventarios_url, notice: 'Paquete inventario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paquete_inventario
      @paquete_inventario = PaqueteInventario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paquete_inventario_params
      params.require(:paquete_inventario).permit(:id_inventario, :id_paquete, :cantidad)
    end
end
