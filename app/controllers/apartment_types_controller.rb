class ApartmentTypesController < ApplicationController
  before_action :set_apartment_type, only: [:show, :edit, :update, :destroy]

  # GET /apartment_types
  # GET /apartment_types.json
  def index
    @apartment_types = ApartmentType.all
  end

  # GET /apartment_types/1
  # GET /apartment_types/1.json
  def show
  end

  # GET /apartment_types/new
  def new
    @apartment_type = ApartmentType.new
  end

  # GET /apartment_types/1/edit
  def edit
  end

  # POST /apartment_types
  # POST /apartment_types.json
  def create
    @apartment_type = ApartmentType.new(apartment_type_params)

    respond_to do |format|
      if @apartment_type.save
        format.html { redirect_to @apartment_type, notice: 'Apartment type was successfully created.' }
        format.json { render :show, status: :created, location: @apartment_type }
      else
        format.html { render :new }
        format.json { render json: @apartment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_types/1
  # PATCH/PUT /apartment_types/1.json
  def update
    respond_to do |format|
      if @apartment_type.update(apartment_type_params)
        format.html { redirect_to @apartment_type, notice: 'Apartment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment_type }
      else
        format.html { render :edit }
        format.json { render json: @apartment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_types/1
  # DELETE /apartment_types/1.json
  def destroy
    @apartment_type.destroy
    respond_to do |format|
      format.html { redirect_to apartment_types_url, notice: 'Apartment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_type
      @apartment_type = ApartmentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_type_params
      params.require(:apartment_type).permit(:name, :code, :initial_deposit, :monthly_rent)
    end
end
