class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.integer :gender
      t.date :dob
      t.integer :salary
      t.string :username
      t.string :password

      t.timestamps null: false
    end
    add_index :staffs, :position
    add_index :staffs, :gender
  end
end
