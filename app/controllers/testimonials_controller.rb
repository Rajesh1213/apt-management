class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :force_profile, except: [:index]
  skip_before_filter :authenticate_user!

  # GET /testimonials
  # GET /testimonials.json
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      testimonial_search_term = SearchTerm.new(@keywords, { search_types: ['content'] })
      @testimonials = Testimonial.where(
          testimonial_search_term.where_clause,
          testimonial_search_term.where_args).
        order(testimonial_search_term.order)

      logger.debug testimonial_search_term.where_clause
      logger.debug testimonial_search_term.where_args

      logger.debug "Testing"
    else
      @testimonials = Testimonial.all
    end
  end

  # GET /testimonials/1
  # GET /testimonials/1.json
  def show
  end

  # GET /testimonials/new
  def new
    @testimonial = Testimonial.new
  end

  # GET /testimonials/1/edit
  def edit
  end

  # POST /testimonials
  # POST /testimonials.json
  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.tenant = current_user.tenant
    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to tenant_path(current_user.tenant), notice: 'Thank you for your feedback!' }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testimonials/1
  # PATCH/PUT /testimonials/1.json
  def update
    respond_to do |format|
      if @testimonial.update(testimonial_params)
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    @testimonial.destroy
    respond_to do |format|
      format.html { redirect_to testimonials_url, notice: 'Testimonial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testimonial_params
      params.require(:testimonial).permit(:date_entered, :content)
    end
end
