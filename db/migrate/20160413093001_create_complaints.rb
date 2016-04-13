class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.date :date_filed
      t.text :rental_complaint
      t.text :apartment_complaint
      t.integer :status
      t.references :complaintable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :complaints, :status
  end
end
