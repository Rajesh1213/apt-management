class Staff < ActiveRecord::Base
  enum gender: { male: 0, female: 1 }
  enum position: { customer_service: 0, assistant: 2, manager: 3, supervisor: 4 }

  has_many :complaints, as: :complaintable
  has_one :user
end
