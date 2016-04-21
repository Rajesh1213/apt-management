class AddUserIdToStaff < ActiveRecord::Migration
  def change
    add_reference :staffs, :user, index: true, foreign_key: true
  end
end
