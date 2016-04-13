class CreateTenantAutos < ActiveRecord::Migration
  def change
    create_table :tenant_autos do |t|
      t.string :license_number
      t.string :auto_make
      t.string :auto_model
      t.string :auto_year
      t.string :auto_color

      t.timestamps null: false
    end
  end
end
