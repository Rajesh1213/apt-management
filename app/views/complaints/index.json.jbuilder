json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :date_filed, :rental_complaint, :apartment_complaint, :status, :complaintable_id, :complaintable_type
  json.url complaint_url(complaint, format: :json)
end
