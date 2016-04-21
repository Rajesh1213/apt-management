class RemoveTenantIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :tenant_id
  end
end
