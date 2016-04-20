# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Generate Roles
['tenant', 'assistant', 'manager', 'supervisor'].each do |role|
  Role.find_or_create_by({name: role})
end

#Generate Users
supervisor = User.create( email: "supervisor@oars.com", password: "password", password_confirmation: "password", role_id: 4)
manager = User.create( email: "manager@oars.com", password: "password", password_confirmation: "password", role_id: 3)
assistant = User.create( email: "assistant@oars.com", password: "password", password_confirmation: "password", role_id: 2)

#Generate Tenants
tenant_one = Tenant.create( first_name: "Tenant", last_name: "One", dob: "1990-01-01", marital_status: Tenant.marital_status.single, work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantOne Corp", gender: Tenant.gender.male )
tenant_two = Tenant.create( first_name: "Tenant", last_name: "Two", dob: "1990-01-01", marital_status: Tenant.marital_status.single, work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantTwo Corp", gender: Tenant.gender.male )
tenant_three = Tenant.create( first_name: "Tenant", last_name: "Three", dob: "1990-01-01", marital_status: Tenant.marital_status.single, work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantThree Corp", gender: Tenant.gender.male )

#Generate Apartments

30.times do |i|
  Apartment.create(
    apartment_type: rand(0..3),
    apartment_status: Apartment.apartment_status.vacant
  )
end



# #Generate Staff
# staff_supervisor = Staff.create(
#   first_name: "Supervisor",
#   last_name: "OARS",
#   position: Staff.position.supervisor,
#   gender: Staff.gender.male,
#   dob: "1990-01-04",
#   salary: 20_000
# )
#
# staff_manager = Staff.create(
#   first_name: "Manager",
#   last_name: "OARS",
#   position: Staff.position.manager,
#   gender: Staff.gender.male,
#   dob: "1990-01-03",
#   salary: 20_000
# )
#
# staff_assistant = Staff.create(
#   first_name: "Assistant",
#   last_name: "OARS",
#   position: Staff.position.assistant,
#   gender: Staff.gender.male,
#   dob: "1990-01-02",
#   salary: 20_000
# )
#
# #Generate apartments
# apartment_one = Apartment.create (
#   apartment_type: Apartment.apartment_type.zero_bedroom,
#   status: Apartment.status.vacant
# )
#
# apartment_two = Apartment.create (
#   apartment_type: Apartment.apartment_type.zero_bedroom,
#   status: Apartment.status.vacant
# )
#
# #Generate complaints
# complaint_one = Complaint.create (
#   date_filed: ,
#   rental_complaint: ,
#   apartment_complaint: ,
#   status: ,
#   complaintable_id: ,
#   complaintable_type:
# )
#
# complaint_two = Complaint.create (
#   date_filed: ,
#   rental_complaint: ,
#   apartment_complaint: ,
#   status: ,
#   complaintable_id: ,
#   complaintable_type:
# )
#
# complaint_three = Complaint.create (
#   date_filed: ,
#   rental_complaint: ,
#   apartment_complaint: ,
#   status: ,
#   complaintable_id: ,
#   complaintable_type:
# )
