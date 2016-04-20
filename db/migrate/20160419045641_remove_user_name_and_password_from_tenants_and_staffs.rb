class RemoveUserNameAndPasswordFromTenantsAndStaffs < ActiveRecord::Migration
  def change
    remove_column :tenants, :username
    remove_column :staffs, :username
    remove_column :tenants, :password
    remove_column :staffs, :password
  end
end
