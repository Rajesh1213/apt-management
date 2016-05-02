class RenameSsFromTenantFamilyMembers < ActiveRecord::Migration
  def change
    rename_column :tenant_family_members, :ss, :ssn
  end
end
