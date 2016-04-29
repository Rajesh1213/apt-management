class AddPaidDateTimeAndIsPaidAndAmountToRentalInvoices < ActiveRecord::Migration
  def change
    add_column :rental_invoices, :paid_date, :datetime
    add_column :rental_invoices, :is_paid, :boolean
  end
end
