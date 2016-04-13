json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :first_name, :last_name, :dob, :marital_status, :work_phone, :home_phone, :employer, :gender, :username, :password
  json.url tenant_url(tenant, format: :json)
end
