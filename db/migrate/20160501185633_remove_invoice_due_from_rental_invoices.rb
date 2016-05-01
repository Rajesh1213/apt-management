class RemoveInvoiceDueFromRentalInvoices < ActiveRecord::Migration
  def change
    remove_column :rental_invoices, :invoice_due, :date
  end
end
