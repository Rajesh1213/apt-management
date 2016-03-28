class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :apt_type
      t.integer :apt_status
      t.boolean :apt_utility
      t.float :apt_deposit_amt
      t.float :apt_rent_amt

      t.timestamps null: false
    end
  end
end
