class AddSsnToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :ssn, :integer, index: true
  end
end
