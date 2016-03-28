class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.string :gender
      t.date :dob
      t.integer :salary
      t.string :username

      t.timestamps null: false
    end
  end
end
