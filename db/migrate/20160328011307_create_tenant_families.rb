class CreateTenantFamilies < ActiveRecord::Migration
  def change
    create_table :tenant_families do |t|
      t.string :first_name
      t.string :last_name
      t.string :spouse
      t.string :child
      t.boolean :divorced
      t.boolean :single
      t.string :gender
      t.date :dob

      t.timestamps null: false
    end
  end
end
