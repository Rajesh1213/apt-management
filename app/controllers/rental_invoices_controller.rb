class RentalInvoicesController < ApplicationController
  before_action :set_rental_invoice, only: [:show, :edit, :update, :destroy]

  # GET /rental_invoices
  # GET /rental_invoices.json
  def index
    @rental_invoices = RentalInvoice.all
  end

  # GET /rental_invoices/1
  # GET /rental_invoices/1.json
  def show
  end

  # GET /rental_invoices/new
  def new
    @rental_invoice = RentalInvoice.new
  end

  # GET /rental_invoices/1/edit
  def edit
  end

  # POST /rental_invoices
  # POST /rental_invoices.json
  def create
    @rental_invoice = RentalInvoice.new(rental_invoice_params)

    respond_to do |format|
      if @rental_invoice.save
        format.html { redirect_to @rental_invoice, notice: 'Rental invoice was successfully created.' }
        format.json { render :show, status: :created, location: @rental_invoice }
      else
        format.html { render :new }
        format.json { render json: @rental_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_invoices/1
  # PATCH/PUT /rental_invoices/1.json
  def update
    respond_to do |format|
      if @rental_invoice.update(rental_invoice_params)
        format.html { redirect_to @rental_invoice, notice: 'Rental invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_invoice }
      else
        format.html { render :edit }
        format.json { render json: @rental_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_invoices/1
  # DELETE /rental_invoices/1.json
  def destroy
    @rental_invoice.destroy
    respond_to do |format|
      format.html { redirect_to rental_invoices_url, notice: 'Rental invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_invoice
      @rental_invoice = RentalInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_invoice_params
      params.require(:rental_invoice).permit(:invoice_date, :invoice_due, :cc_number, :cc_type, :cc_expiration_date, :cc_amount_charged)
    end
end
