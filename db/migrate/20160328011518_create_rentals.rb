class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :rental_no
      t.date :rental_date
      t.string :status
      t.date :cancel_date
      t.string :lease_type
      t.date :lease_start
      t.date :lease_end
      t.date :renewal_date

      t.timestamps null: false
    end
  end
end
