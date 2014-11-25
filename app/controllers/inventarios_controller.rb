class InventariosController < ApplicationController
  before_action :set_inventario, only: [:show, :edit, :update, :destroy]

  # GET /inventarios
  # GET /inventarios.json
  def index
    @inventarios = Inventario.all
  end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
  end

  # GET /inventarios/new
  def new
    @inventario = Inventario.new
  end

  # GET /inventarios/1/edit
  def edit
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    
    @inventario = Inventario.new(inventario_params)

    respond_to do |format|
      if @inventario.save
        @inventario.id_inventario = @inventario.id
        @inventario.save
        format.html { redirect_to @inventario, notice: 'Inventario was successfully created.' }
        format.json { render :show, status: :created, location: @inventario }
      else
        format.html { render :new }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventarios/1
  # PATCH/PUT /inventarios/1.json
  def update
    @paquetes = Paquete.joins('INNER JOIN paquete_inventarios ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquete_inventarios.id_paquete' => @inventario.id_inventario).order(id_paquete: :asc)
        @Cantidades = PaqueteInventario.where('id_inventario' => @inventario.id_inventario).order(id_paquete: :asc)
        @i = 0
        @paquetes.each do |paquete|
          paquete.Costo -= @Cantidades[@i].cantidad * @inventario.costo_por_elemento
          paquete.save
          @i += 1 
        end
    respond_to do |format|
      if @inventario.update(inventario_params)
        @paquetes = Paquete.joins('INNER JOIN paquete_inventarios ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquete_inventarios.id_paquete' => @inventario.id_inventario).order(id_paquete: :asc)
        @Cantidades = PaqueteInventario.where('id_inventario' => @inventario.id_inventario).order(id_paquete: :asc)
        @i = 0
        @paquetes.each do |paquete|
          paquete.Costo += @Cantidades[@i].cantidad * @inventario.costo_por_elemento
          paquete.save
          @i += 1 
        end

        format.html { redirect_to @inventario, notice: 'Inventario was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventario }
      else
        format.html { render :edit }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    @pi = PaqueteInventario.where('id_inventario' => @inventario.id_inventario)

    @pi.each do |pi|
      pi.destroy
    end

    @inventario.destroy
    respond_to do |format|
      format.html { redirect_to inventarios_url, notice: 'Inventario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
      @inventario = Inventario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventario_params
      params.require(:inventario).permit(:id_inventario, :Producto, :Cantidad, :costo_por_elemento)
    end
end
