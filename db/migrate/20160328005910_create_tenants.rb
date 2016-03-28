class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :marital_status
      t.string :work_phone
      t.string :home_phone
      t.string :employer
      t.string :gender

      t.timestamps null: false
    end
  end
end
