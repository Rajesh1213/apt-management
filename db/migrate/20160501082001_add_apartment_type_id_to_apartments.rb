class AddApartmentTypeIdToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :apartment_type_id, :integer
  end
end
