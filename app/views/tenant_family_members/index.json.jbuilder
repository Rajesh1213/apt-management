json.array!(@tenant_family_members) do |tenant_family_member|
  json.extract! tenant_family_member, :id, :ss, :name, :member_type, :marital_status, :gender, :dob
  json.url tenant_family_member_url(tenant_family_member, format: :json)
end
