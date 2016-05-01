class AddNumberToRentalInvoices < ActiveRecord::Migration
  def change
    add_column :rental_invoices, :number, :integer, index:true
  end
end
