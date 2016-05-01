class AddTenantIdANdRemoveRentalIdFromTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :tenant_id, :integer, index: true
    remove_column :testimonials, :rental_id, :integer
  end
end
