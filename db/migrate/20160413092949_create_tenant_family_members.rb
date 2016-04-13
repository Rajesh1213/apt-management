class CreateTenantFamilyMembers < ActiveRecord::Migration
  def change
    create_table :tenant_family_members do |t|
      t.string :ss
      t.string :name
      t.integer :member_type
      t.integer :marital_status
      t.integer :gender
      t.date :dob

      t.timestamps null: false
    end
    add_index :tenant_family_members, :member_type
    add_index :tenant_family_members, :marital_status
    add_index :tenant_family_members, :gender
  end
end
