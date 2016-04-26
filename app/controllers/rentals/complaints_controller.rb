class Rentals::ComplaintsController < ComplaintsController
  before_action :set_complaintable

  private

  def set_complaintable
    logger.debug "Setting Complaintable From Rentals::CompalintsController"
    @complaintable = Rental.find(params[:rental_id])
    logger.debug "Set #{@complaintable} on Rentals::ComplaintsController"
  end
end
