class AddNumberToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :number, :integer, index:true
  end
end
