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

      t.timestamps null: false
    end
    add_index :rentals, :status
    add_index :rentals, :lease_type
  end
end
