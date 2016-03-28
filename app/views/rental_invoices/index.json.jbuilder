json.array!(@rental_invoices) do |rental_invoice|
  json.extract! rental_invoice, :id, :invoice_no, :invoice_date, :invoice_due_date, :cc_no, :cc_type, :cc_exp_date, :cc_amt
  json.url rental_invoice_url(rental_invoice, format: :json)
end
