class AddTenantIdToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :tenant_id, :integer, index: true
  end
end
