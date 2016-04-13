class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :marital_status
      t.string :work_phone
      t.string :home_phone
      t.string :employer
      t.integer :gender
      t.string :username
      t.string :password

      t.timestamps null: false
    end
    add_index :tenants, :marital_status
  end
end
