json.array!(@tenant_autos) do |tenant_auto|
  json.extract! tenant_auto, :id, :license_number, :auto_make, :auto_model, :auto_year, :auto_color
  json.url tenant_auto_url(tenant_auto, format: :json)
end
