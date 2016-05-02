module ComplaintsHelper
  def get_parent(complaint)
    case complaint.complaintable_type
    when "Apartment"
      Apartment.find_by_id(complaint.complaintable_id)
    when "Rental"
      Rental.find_by_id(complaint.complaintable_id)
    end
  end

end
