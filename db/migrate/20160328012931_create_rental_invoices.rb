class CreateRentalInvoices < ActiveRecord::Migration
  def change
    create_table :rental_invoices do |t|
      t.integer :invoice_no
      t.date :invoice_date
      t.date :invoice_due_date
      t.string :cc_no
      t.string :cc_type
      t.string :cc_exp_date
      t.float :cc_amt

      t.timestamps null: false
    end
  end
end
