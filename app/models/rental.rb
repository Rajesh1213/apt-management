class Rental < ActiveRecord::Base
  enum status: { signed_not_occupied: 0, occupied: 1}
  enum lease_type: { one_year: 0, six_months: 1 }

  belongs_to :apartment
  belongs_to :tenant

  has_many :rental_invoices
  has_many :tenant_autos
  has_many :tenant_family_members
  
  has_many :complaints, as: :complaintable
end
