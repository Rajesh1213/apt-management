class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :apartment_type
      t.integer :status

      t.timestamps null: false
    end
    add_index :apartments, :apartment_type
    add_index :apartments, :status
  end
end
