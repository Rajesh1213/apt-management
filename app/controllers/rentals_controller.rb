class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :force_profile

  # GET /rentals
  # GET /rentals.json
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      rental_search_term = RentalSearchTerm.new(@keywords)
      @rentals = Rental.where(
          rental_search_term.where_clause,
          rental_search_term.where_args).
        order(rental_search_term.order)
      logger.debug rental_search_term.where_clause
      logger.debug "Testing"
    else
      @rentals = Rental.all
      if current_user.role.name == "tenant"
        @rentals = Rental.all.where( tenant: @current_user.tenant)
      end
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show

  end

  # GET /rentals/new
  def new
    @rental = Rental.new(params[:apartment])
    @apartments = Apartment.all.where( status: Apartment.statuses[:vacant])
    @tenants = Tenant.all
  end

  # GET /rentals/1/edit
  def edit
    @apartments = Apartment.all
    @tenants = Tenant.all
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:sign_date, :status, :cancel_date, :lease_type, :lease_start, :lease_end, :renewal_date, :has_utility, :deposit_amount, :rent_amount, :tenant_id, :apartment_id)
    end
end
