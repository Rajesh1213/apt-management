class Complaint < ActiveRecord::Base
  belongs_to :complaintable, polymorphic: true
end
