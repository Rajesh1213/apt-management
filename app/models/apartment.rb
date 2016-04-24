class Apartment < ActiveRecord::Base
  enum apartment_type: { zero_bedroom: 0, one_bedroom: 1, two_bedroom: 2, three_bedroom: 3 }
  enum apartment_status: { vacant: 0, rented: 1 }
  has_many :rentals
  has_many :tenants, through: :rentals
end
