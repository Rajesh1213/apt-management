class Apartments::ComplaintsController < ComplaintsController
  before_action :set_complaintable

  private

  def set_complaintable
    logger.debug "Complaint Controller: Setting Complaint"
    @complaintable = Apartment.find(params[:apartment_id])

    logger.debug "Complaint Controller: Set #{@complaintable}"
  end
end
