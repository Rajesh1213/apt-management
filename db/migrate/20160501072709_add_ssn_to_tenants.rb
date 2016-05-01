class AddSsnToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :ssn, :string, index: true
  end
end
