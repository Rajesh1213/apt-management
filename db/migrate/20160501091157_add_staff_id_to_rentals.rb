class AddStaffIdToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :staff_id, :integer, index: true
  end
end
