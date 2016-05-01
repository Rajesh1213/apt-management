class CreateApartmentTypes < ActiveRecord::Migration
  def change
    create_table :apartment_types do |t|
      t.string :name
      t.string :code
      t.decimal :initial_deposit
      t.decimal :monthly_rent

      t.timestamps null: false
    end
  end
end
