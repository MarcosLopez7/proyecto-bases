class FiestaController < ApplicationController
  before_action :set_fiestum, only: [:show, :edit, :update, :destroy]

  # GET /fiesta
  # GET /fiesta.json
  def index
    @id_cliente = EmpleadoCliente.joins('INNER JOIN (empleados INNER JOIN users ON empleados.email = users.email) ON empleados.id_empleado = empleado_clientes.id_empleado').where('empleados.email' => 'marcos@gmail.com').order(created_at: :asc)[0].id_cliente

    @fiesta = Fiestum.joins('INNER JOIN clientes ON clientes.id_cliente = fiesta.id_cliente').where('fiesta.id_cliente' => @id_cliente)
  end

  # GET /fiesta/1
  # GET /fiesta/1.json
  def show
  end

  # GET /fiesta/new
  def new
    @fiestum = Fiestum.new
  end

  # GET /fiesta/1/edit
  def edit
  end

  # POST /fiesta
  # POST /fiesta.json
  def create
    
    @id_cliente = EmpleadoCliente.joins('INNER JOIN (empleados INNER JOIN users ON empleados.email = users.email) ON empleados.id_empleado = empleado_clientes.id_empleado').where('empleados.email' => 'marcos@gmail.com').order(created_at: :asc)[0].id_cliente
    @fiestum = Fiestum.new(fiestum_params)
    @fiestum.id_fiesta = Fiestum.last.id + 1
    @fiestum.id_cliente = @id_cliente

    @inventarios = Inventario.joins('INNER JOIN (paquete_inventarios INNER JOIN paquetes ON paquete_inventarios.id_paquete = paquetes.id_paquete) ON paquete_inventarios.id_inventario = inventarios.id_inventario').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @cantidades = PaqueteInventario.joins('INNER JOIN paquetes ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @i = 0
    @inventarios.each do |inventario|
      if (inventario.Cantidad - @cantidades[@i].cantidad) > 0
        inventario.Cantidad -= @cantidades[@i].cantidad
        inventario.save
        @i += 1
      else
        redirect_to new_fiesta_path, notice: 'No hay suficiente objetos en el inventario para la fiesta.'
        break
      end
    end
    respond_to do |format|
      if @fiestum.save 

        @fiestum.costo = Paquete.where('id_paquete' => @fiestum.id_paquete)[0].Costo
        format.html { redirect_to @fiestum, notice: 'Fiestum was successfully created.' }
        format.json { render :show, status: :created, location: @fiestum }
      else
        format.html { render :new }
        format.json { render json: @fiestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiesta/1
  # PATCH/PUT /fiesta/1.json
  def update
    @inventarios = Inventario.joins('INNER JOIN (paquete_inventarios INNER JOIN paquetes ON paquete_inventarios.id_paquete = paquetes.id_paquete) ON paquete_inventarios.id_inventario = inventarios.id_inventario').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @cantidades = PaqueteInventario.joins('INNER JOIN paquetes ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @i = 0
    @inventarios.each do |inventario|
      inventario.Cantidad += @cantidades[@i].cantidad
      inventario.save
      @i += 1
    end
    respond_to do |format|
      
      if @fiestum.update(fiestum_params)

        @inventarios = Inventario.joins('INNER JOIN (paquete_inventarios INNER JOIN paquetes ON paquete_inventarios.id_paquete = paquetes.id_paquete) ON paquete_inventarios.id_inventario = inventarios.id_inventario').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
        @cantidades = PaqueteInventario.joins('INNER JOIN paquetes ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
        @i = 0
        @inventarios.each do |inventario|
          inventario.Cantidad -= @cantidades[@i].cantidad
          inventario.save
          @i += 1
        end
        @fiestum.costo = Paquete.where('id_paquete' => @fiestum.id_paquete)[0].Costo
        format.html { redirect_to @fiestum, notice: 'Fiestum was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiestum }
      else
        format.html { render :edit }
        format.json { render json: @fiestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiesta/1
  # DELETE /fiesta/1.json
  def destroy
    @inventarios = Inventario.joins('INNER JOIN (paquete_inventarios INNER JOIN paquetes ON paquete_inventarios.id_paquete = paquetes.id_paquete) ON paquete_inventarios.id_inventario = inventarios.id_inventario').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @cantidades = PaqueteInventario.joins('INNER JOIN paquetes ON paquetes.id_paquete = paquete_inventarios.id_paquete').where('paquetes.id_paquete' => @fiestum.id_paquete).order(id_inventario: :asc)
    @i = 0
    @inventarios.each do |inventario|
      inventario.Cantidad += @cantidades[@i].cantidad
      inventario.save
      @i += 1
    end
    @fiestum.destroy
    respond_to do |format|
      format.html { redirect_to fiesta_url, notice: 'Fiestum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiestum
      @fiestum = Fiestum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiestum_params
      params.require(:fiestum).permit(:id_fiesta, :fecha, :id_cliente, :id_paquete, :costo)
    end
end
