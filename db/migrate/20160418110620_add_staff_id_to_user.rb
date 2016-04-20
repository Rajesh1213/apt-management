class AddStaffIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :staff, index: true, foreign_key: true
  end
end
