# Author: Aileen Tran
# Verified by: Aarti Bhasker
# 4/20/2016

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


# Generate apartments

studio = ApartmentType.create( name: "Studio", code: "zero_bedroom",  initial_deposit: 300, monthly_rent: 300 )

one_bedroom = ApartmentType.create( name: "One Bedroom", code: "one_bedroom",  initial_deposit: 400, monthly_rent: 400 )

two_bedrooms = ApartmentType.create( name: "Two Bedroom", code: "two_bedroom",  initial_deposit: 500, monthly_rent: 500 )

three_bedrooms = ApartmentType.create( name: "Three Bedroom", code: "three_bedroom",  initial_deposit: 700, monthly_rent: 700 )

#Generate Users
supervisor = User.create( username: "SUPERVISOR", email: "supervisor@oars.com", password: "SUPERVISOR#", password_confirmation: "SUPERVISOR#", role_id: 4)
manager = User.create( username: "MANAGER", email: "manager@oars.com", password: "MANAGER#", password_confirmation: "MANAGER#", role_id: 3)
assistant_one = User.create( username: "ASSISTANT1", email: "assistant1@oars.com", password: "ASSISTANT1#", password_confirmation: "ASSISTANT1#", role_id: 2)
assistant_two = User.create( username: "ASSISTANT2", email: "assistant2@oars.com", password: "ASSISTANT2#", password_confirmation: "ASSISTANT2#", role_id: 2)
assistant_three = User.create( username: "ASSISTANT3", email: "assistant3@oars.com", password: "ASSISTANT3#", password_confirmation: "ASSISTANT3#", role_id: 2)


staff_supervisor = Staff.create( first_name: "Susan", last_name: "Brandon", position: Staff.positions[:supervisor], gender: Staff.genders[:female], dob: "1977-03-10", salary: 46_000, user: supervisor )

staff_manager = Staff.create( first_name: "Terry", last_name: "Ford", position: Staff.positions[:manager], gender: Staff.genders[:male], dob: "1967-10-20", salary: 53_000, user: manager)

staff_assistant_one = Staff.create( first_name: "Joe", last_name: "White", position: Staff.positions[:assistant], gender: Staff.genders[:male], dob: "1982-07-08", salary: 24_000, user: assistant_one )

staff_assistant_two = Staff.create( first_name: "Ann", last_name: "Tremble", position: Staff.positions[:assistant], gender: Staff.genders[:female], dob: "1981-06-12", salary: 26_000, user: assistant_two )

staff_assistant_three = Staff.create( first_name: "Julia", last_name: "Roberts", position: Staff.positions[:assistant], gender: Staff.genders[:female], dob: "1982-09-12", salary: 28_000, user: assistant_three)

# Create User Tenants
user_tenant_one = User.create( username: "TENANT1", email: "jack.robin@email.com", password: "TENANT1#", password_confirmation: "TENANT1#", role_id: Role.find_by_name("tenant") )

user_tenant_two = User.create( username: "TENANT2", email: "mary.stackles@email.com", password: "TENANT2#", password_confirmation: "TENANT2#", role_id: Role.find_by_name("tenant") )

user_tenant_three = User.create( username: "TENANT3", email: "ramu.reddy@email.com", password: "TENANT3#", password_confirmation: "TENANT3#", role_id: Role.find_by_name("tenant") )

user_tenant_four = User.create( username: "TENANT4", email: "marion.black@email.com", password: "TENANT4#", password_confirmation: "TENANT4#", role_id: Role.find_by_name("tenant") )

user_tenant_five = User.create( username: "TENANT5", email: "venessa.williams@gmail.com", password: "TENANT5#", password_confirmation: "TENANT5#", role_id: Role.find_by_name("tenant") )


#Generate Tenants
tenant_one = Tenant.create( first_name: "Jack", last_name: "Robin", dob: "1960-06-21", marital_status: Tenant.marital_statuses[:married], work_phone: "417-345-2323", home_phone: "417-555-6565", employer: "Kraft Inc", gender: Tenant.genders[:male], user: user_tenant_one, ssn: Faker::Medical::SSN.ssn)
tenant_two = Tenant.create( first_name: "Mary", last_name: "Stackles", dob: "1980-08-02", marital_status: Tenant.marital_statuses[:single], work_phone: "417-545-3320", home_phone: "417-666-7565", employer: "Kraft Inc", gender: Tenant.genders[:female], user: user_tenant_two, ssn: Faker::Medical::SSN.ssn)
tenant_three = Tenant.create( first_name: "Ramu", last_name: "Reddy", dob: "1962-04-02", marital_status: Tenant.marital_statuses[:married], work_phone: "417-836-2323", home_phone: "417-222-0565", employer: "SMSU", gender: Tenant.genders[:male], user: user_tenant_three, ssn: Faker::Medical::SSN.ssn)
tenant_four = Tenant.create( first_name: "Marion", last_name: "Black", dob: "1981-05-25", marital_status: Tenant.marital_statuses[:single], work_phone: "417-425-7766", home_phone: "417-677-2364", employer: "SMSU", gender: Tenant.genders[:male], user: user_tenant_four, ssn: Faker::Medical::SSN.ssn)
tenant_five = Tenant.create( first_name: 'Venessa', last_name: "Williams", dob: "1970-03-12", marital_status: Tenant.marital_statuses[:married], work_phone: "417-555-7878", home_phone: "417-677-2364", employer: "Kraft Inc", gender: Tenant.genders[:female], user: user_tenant_five , ssn: Faker::Medical::SSN.ssn)

tenants = [tenant_one, tenant_two, tenant_three, tenant_four, tenant_five]

# Generate Apartments


# Generate Rental


# Generate Complaints


# Generate Auto


# Generate Family


# Generate Rental invoice due


# Generate Testimonial


# Generate Apartments
apartment_types = [studio, one_bedroom, two_bedrooms, three_bedrooms]
30.times do |i|
  apartment = Apartment.create(
    #apartment_type: rand(0..3),
    status: Apartment.statuses[:vacant],
    apartment_type: apartment_types.sample
  )

  rental = Rental.create(
    sign_date: "2015-01-#{format('%02d', i)}",
    status: Rental.statuses[:signed_not_occupied],
    lease_type: Rental.lease_types[:one_year],
    lease_start: "2015-01-#{format('%02d', i)}",
    lease_end: "2016-01-#{format('%02d', i)}",
    renewal_date: "2016-01-#{format('%02d', i)}",
    has_utility: true,
    deposit_amount: apartment.apartment_type.initial_deposit,
    rent_amount: apartment.apartment_type.monthly_rent,
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

  RentalInvoice.create(invoice_date: Date.today, invoice_due: Date.today, rental: rental, amount: rental.deposit_amount, note: "Initial Deposit")

  rental_invoice = RentalInvoice.create(
    invoice_date: rental.lease_start,
    invoice_due: "2015-01-#{format('%02d', i)}",
    cc_number: Faker::Business.credit_card_number,
    cc_type: Faker::Business.credit_card_type,
    cc_expiration_date: Faker::Business.credit_card_expiry_date,
    rental: rental,
    amount: rental.deposit_amount,
    note: "First Rental Invoice"
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
