class CreateTenantautos < ActiveRecord::Migration
  def change
    create_table :tenantautos do |t|
      t.string :license_no
      t.string :auto_make
      t.string :auto_model
      t.string :auto_year
      t.string :auto_color

      t.timestamps null: false
    end
  end
end
