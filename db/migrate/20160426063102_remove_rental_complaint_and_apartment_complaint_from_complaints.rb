class RemoveRentalComplaintAndApartmentComplaintFromComplaints < ActiveRecord::Migration
  def change
    remove_column :complaints, :rental_complaint
    remove_column :complaints, :apartment_complaint
  end
end
