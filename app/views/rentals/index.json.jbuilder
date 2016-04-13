json.array!(@rentals) do |rental|
  json.extract! rental, :id, :sign_date, :status, :cancel_date, :lease_type, :lease_start, :lease_end, :renewal_date, :has_utility, :deposit_amount, :rent_amount
  json.url rental_url(rental, format: :json)
end
