class RemoveSsnFromStaff < ActiveRecord::Migration
  def change
    remove_column :staffs, :ssn, :integer, index: true
  end
end
