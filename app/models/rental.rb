class Rental < ActiveRecord::Base
  enum status: { signed_not_occupied: 0, occupied: 1}
  enum lease_type: { one_year: 0, six_months: 1 }

  after_save :validate_vacancy
  after_create :validate_vacancy

  belongs_to :apartment
  belongs_to :tenant

  has_many :rental_invoices
  has_many :tenant_autos
  has_many :tenant_family_members

  has_many :complaints, as: :complaintable
  belongs_to :staff

  def validate_vacancy
    if self.status == Rental.statuses.keys[Rental.statuses[:occupied]] && self.apartment.present?
      @apartment = Apartment.find(self.apartment)
      @apartment.status = Apartment.statuses[:rented]
      @apartment.save
    end
  end
end
