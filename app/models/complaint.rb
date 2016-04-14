class Complaint < ActiveRecord::Base
  enum status: { fixed: 0, pending: 1, not_determined: 2 }
  belongs_to :complaintable, polymorphic: true
end
