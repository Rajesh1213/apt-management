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
supervisor = User.create( username: "supervisor", email: "supervisor@oars.com", password: "password", password_confirmation: "password", role_id: 4)
manager = User.create( username: "manager", email: "manager@oars.com", password: "password", password_confirmation: "password", role_id: 3)
assistant = User.create( username: "assistant", email: "assistant@oars.com", password: "password", password_confirmation: "password", role_id: 2)

staff_supervisor = Staff.create( first_name: "Sully", last_name: "Supervisor", position: Staff.positions[:supervisor], gender: Staff.genders[:male], dob: "1990-01-01", salary: 50_000, user: supervisor)

staff_manager = Staff.create( first_name: "Mary", last_name: "Manager", position: Staff.positions[:manager], gender: Staff.genders[:female], dob: "1990-01-02", salary: 40_000, user: manager)

staff_assistant = Staff.create( first_name: "Alex", last_name: "Assistant", position: Staff.positions[:assistant], gender: Staff.genders[:male], dob: "1990-01-03", salary: 30_000, user: assistant)


# Create User Tenants
user_tenant_one = User.create( username: "john", email: "john@mail.com", password: "password", password_confirmation: "password", role_id: Role.find_by_name("tenant") )

user_tenant_two = User.create( username: "jane", email: "jane@mail.com", password: "password", password_confirmation: "password", role_id: Role.find_by_name("tenant") )

user_tenant_three = User.create( username: "personmcperson", email: "person-mcperson@mail.com", password: "password", password_confirmation: "password", role_id: Role.find_by_name("tenant") )

#Generate Tenants
tenant_one = Tenant.create( first_name: "John", last_name: "Knowles", dob: "1990-01-01", marital_status: Tenant.marital_statuses[:single], work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantOne Corp", gender: Tenant.genders[:male], user: user_tenant_one)
tenant_two = Tenant.create( first_name: "Jane", last_name: "Smith", dob: "1990-01-01", marital_status: Tenant.marital_statuses[:single], work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantTwo Corp", gender: Tenant.genders[:male], user: user_tenant_two)
tenant_three = Tenant.create( first_name: "Person", last_name: "McPerson", dob: "1990-01-01", marital_status: Tenant.marital_statuses[:single], work_phone: "555-555-5555", home_phone: "555-555-6666", employer: "TenantThree Corp", gender: Tenant.genders[:male], user: user_tenant_three )

tenants = [tenant_one, tenant_two, tenant_three]

#Generate Apartments

30.times do |i|
  apartment = Apartment.create(
    apartment_type: rand(0..3),
    status: Apartment.statuses[:vacant]
  )

  rental = Rental.create(
    sign_date: "2015-01-#{format('%02d', i)}",
    status: Rental.statuses[:signed_not_occupied],
    lease_type: Rental.lease_types[:one_year],
    lease_start: "2015-01-#{format('%02d', i)}",
    lease_end: "2016-01-#{format('%02d', i)}",
    renewal_date: "2016-01-#{format('%02d', i)}",
    has_utility: true,
    deposit_amount: 1_000,
    rent_amount: 1_000,
    tenant: tenants[rand(0..tenants.count-1)],
    apartment: apartment
  )

  tenant_family_member = TenantFamilyMember.create(
    ss: "000-00-000",
    name: Faker::Name.name,
    member_type: TenantFamilyMember.member_types[:relative],
    marital_status: TenantFamilyMember.marital_statuses[:single],
    gender: TenantFamilyMember.genders[:male],
    dob: "1992-02-01",
    rental: rental
  )

  tenant_auto = TenantAuto.create(
    license_number: "xxx-xxxx",
    auto_make: "Tesla",
    auto_model: "Sedan",
    auto_year: 2016,
    auto_color: "Black",
    rental: rental
  )

  rental_invoice = RentalInvoice.create(
    invoice_date: rental.lease_start,
    invoice_due: "2015-01-#{format('%02d', i)}",
    cc_number: Faker::Business.credit_card_number,
    cc_type: Faker::Business.credit_card_type,
    cc_expiration_date: Faker::Business.credit_card_expiry_date,
    rental: rental
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
