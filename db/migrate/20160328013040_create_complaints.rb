class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.date :complaint_date
      t.text :rental_complaint
      t.text :apt_complaint
      t.string :status

      t.timestamps null: false
    end
  end
end
