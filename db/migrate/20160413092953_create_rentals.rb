class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :sign_date
      t.integer :status
      t.date :cancel_date
      t.integer :lease_type
      t.date :lease_start
      t.date :lease_end
      t.date :renewal_date
      t.boolean :has_utility
      t.decimal :deposit_amount
      t.decimal :rent_amount

      t.belongs_to :tenant, index: true
      t.belongs_to :apartment, index: true

      t.timestamps null: false
    end

    change_table :tenant_autos do |t|
      t.belongs_to :rental, index: true
    end

    change_table :tenant_family_members do |t|
      t.belongs_to :rental, index: true
    end


    add_index :rentals, :status
    add_index :rentals, :lease_type
  end
end
