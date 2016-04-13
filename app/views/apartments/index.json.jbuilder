json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :apartment_type, :status
  json.url apartment_url(apartment, format: :json)
end
