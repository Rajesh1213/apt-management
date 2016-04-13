json.array!(@rental_invoices) do |rental_invoice|
  json.extract! rental_invoice, :id, :invoice_date, :invoice_due, :cc_number, :cc_type, :cc_expiration_date, :cc_amount_charged
  json.url rental_invoice_url(rental_invoice, format: :json)
end
