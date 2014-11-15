class FiestaController < ApplicationController
  before_action :set_fiestum, only: [:show, :edit, :update, :destroy]

  # GET /fiesta
  # GET /fiesta.json
  def index
    @fiesta = Fiestum.all
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
    @fiestum = Fiestum.new(fiestum_params)

    respond_to do |format|
      if @fiestum.save
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
    respond_to do |format|
      if @fiestum.update(fiestum_params)
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
      params.require(:fiestum).permit(:id_fiesta, :fecha, :id_cliente, :id_empleado, :id_paquete)
    end
end
