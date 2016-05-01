class CreateRentalInvoices < ActiveRecord::Migration
  def change
    create_table :rental_invoices do |t|
      t.date :invoice_date
      t.string :cc_number
      t.string :cc_type
      t.string :cc_expiration_date
      t.decimal :cc_amount_charged
      t.belongs_to :rental, index: true

      t.timestamps null: false
    end
  end
end
