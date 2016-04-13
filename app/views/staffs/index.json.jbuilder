json.array!(@staffs) do |staff|
  json.extract! staff, :id, :first_name, :last_name, :position, :gender, :dob, :salary, :username, :password
  json.url staff_url(staff, format: :json)
end
