class AddUserIdToTenant < ActiveRecord::Migration
  def change
    add_reference :tenants, :user, index: true, foreign_key: true
  end
end
