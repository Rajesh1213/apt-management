class RemoveApartmentTypeFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :apartment_type, :integer
  end
end
