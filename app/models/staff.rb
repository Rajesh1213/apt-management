class Staff < ActiveRecord::Base
  enum gender: { male: 0, female: 1 }
  enum position: { assistant: 0, manager: 1, supervisor: 2, customer_service: 3 }

  has_many :complaints, :as :complaintable
end
