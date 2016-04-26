class Staff < ActiveRecord::Base
  validates :first_name, presence: true

  enum gender: { male: 0, female: 1 }
  enum position: { customer_service: 0, assistant: 2, manager: 3, supervisor: 4 }
  
  belongs_to :user
end
