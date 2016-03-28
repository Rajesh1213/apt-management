json.array!(@rentals) do |rental|
  json.extract! rental, :id, :rental_no, :rental_date, :status, :cancel_date, :lease_type, :lease_start, :lease_end, :renewal_date
  json.url rental_url(rental, format: :json)
end
