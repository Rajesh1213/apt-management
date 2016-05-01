json.array!(@apartment_types) do |apartment_type|
  json.extract! apartment_type, :id, :name, :code, :initial_deposit, :monthly_rent
  json.url apartment_type_url(apartment_type, format: :json)
end
