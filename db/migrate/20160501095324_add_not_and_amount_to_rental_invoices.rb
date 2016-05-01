class AddNotAndAmountToRentalInvoices < ActiveRecord::Migration
  def change
    add_column :rental_invoices, :note, :text
    add_column :rental_invoices, :amount, :decimal
  end
end
