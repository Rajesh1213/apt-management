class TenantFamilyMembersController < ApplicationController
  before_action :set_tenant_family_member, only: [:show, :edit, :update, :destroy]
  before_action :set_rental, only: [:show, :edit, :destroy]

  # GET /tenant_family_members
  # GET /tenant_family_members.json
  def index
    @rental = Rental.find(params[:rental_id])
    @tenant_family_members = TenantFamilyMember.where(rental: @rental)
  end

  # GET /tenant_family_members/1
  # GET /tenant_family_members/1.json
  def show
  end

  # GET /tenant_family_members/new
  def new
    @rental = Rental.find(params[:rental_id])
    @tenant_family_member = TenantFamilyMember.new
  end

  # GET /tenant_family_members/1/edit
  def edit
  end

  # POST /tenant_family_members
  # POST /tenant_family_members.json
  def create
    @rental = Rental.find(params[:rental_id])
    @tenant_family_member = TenantFamilyMember.new(tenant_family_member_params)
    @tenant_family_member.rental = @rental

    respond_to do |format|
      if @tenant_family_member.save
        format.html { redirect_to @rental, notice: 'Tenant family member was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_family_member }
      else
        format.html { render :new }
        format.json { render json: @tenant_family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_family_members/1
  # PATCH/PUT /tenant_family_members/1.json
  def update
    respond_to do |format|
      if @tenant_family_member.update(tenant_family_member_params)
        format.html { redirect_to @tenant_family_member, notice: 'Tenant family member was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_family_member }
      else
        format.html { render :edit }
        format.json { render json: @tenant_family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_family_members/1
  # DELETE /tenant_family_members/1.json
  def destroy
    @tenant_family_member.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Tenant family member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_family_member
      @tenant_family_member = TenantFamilyMember.find(params[:id])
    end

    def set_rental
      @rental = Rental.find_by_id(params[:rental_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_family_member_params
      params.require(:tenant_family_member).permit(:ss, :name, :member_type, :marital_status, :gender, :dob)
    end
end
