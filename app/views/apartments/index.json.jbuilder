json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :apt_type, :apt_status, :apt_utility, :apt_deposit_amt, :apt_rent_amt
  json.url apartment_url(apartment, format: :json)
end
