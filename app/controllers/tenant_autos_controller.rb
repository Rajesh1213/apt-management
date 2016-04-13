class TenantAutosController < ApplicationController
  before_action :set_tenant_auto, only: [:show, :edit, :update, :destroy]

  # GET /tenant_autos
  # GET /tenant_autos.json
  def index
    @tenant_autos = TenantAuto.all
  end

  # GET /tenant_autos/1
  # GET /tenant_autos/1.json
  def show
  end

  # GET /tenant_autos/new
  def new
    @tenant_auto = TenantAuto.new
  end

  # GET /tenant_autos/1/edit
  def edit
  end

  # POST /tenant_autos
  # POST /tenant_autos.json
  def create
    @tenant_auto = TenantAuto.new(tenant_auto_params)

    respond_to do |format|
      if @tenant_auto.save
        format.html { redirect_to @tenant_auto, notice: 'Tenant auto was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_auto }
      else
        format.html { render :new }
        format.json { render json: @tenant_auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_autos/1
  # PATCH/PUT /tenant_autos/1.json
  def update
    respond_to do |format|
      if @tenant_auto.update(tenant_auto_params)
        format.html { redirect_to @tenant_auto, notice: 'Tenant auto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_auto }
      else
        format.html { render :edit }
        format.json { render json: @tenant_auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_autos/1
  # DELETE /tenant_autos/1.json
  def destroy
    @tenant_auto.destroy
    respond_to do |format|
      format.html { redirect_to tenant_autos_url, notice: 'Tenant auto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_auto
      @tenant_auto = TenantAuto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_auto_params
      params.require(:tenant_auto).permit(:license_number, :auto_make, :auto_model, :auto_year, :auto_color)
    end
end
