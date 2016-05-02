class Complaint < ActiveRecord::Base
  enum status: { fixed: 0, pending: 1, not_determined: 2 }
  belongs_to :complaintable, polymorphic: true
  belongs_to :user

  scope :pending, -> { where("status is NULL or 1") }
  scope :not_determined, -> { where("status is 2") }
  scope :fixed, -> { where("status is 0" ) }

  def get_parent(complaint)
    case complaint.complaintable_type
    when "Apartment"
      Apartment.find_by_id(complaint.complaintable_id)
    when "Rental"
      Rental.find_by_id(complaint.complaintable_id)
    end
  end

end
