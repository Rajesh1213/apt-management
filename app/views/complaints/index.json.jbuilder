json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :complaint_date, :rental_complaint, :apt_complaint, :status
  json.url complaint_url(complaint, format: :json)
end
