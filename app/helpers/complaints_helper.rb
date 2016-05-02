module ComplaintsHelper
  def get_parent(complaint)
    case complaint.complaintable_type
    when "Apartment"
      Apartment.find_by_id(complaint.complaintable_id)
    when "Rental"
      Rental.find_by_id(complaint.complaintable_id)
    end
  end

  def status_class(complaint)
    case complaint.status
    when Complaint.statuses.to_hash.key(Complaint.statuses[:not_determined])
      " warning"
    when Complaint.statuses.to_hash.key(Complaint.statuses[:fixed])
      " success"
    when Complaint.statuses.to_hash.key(Complaint.statuses[:pending])
      " danger"
    end
  end

end
