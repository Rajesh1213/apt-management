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

studio = ApartmentType.create(
	name: "Studio",
	code: "zero_bedroom",
	initial_deposit: 200,
	monthly_rent: 300
)

one_bedroom = ApartmentType.create(
	name: "One Bedroom",
	code: "one_bedroom",
	initial_deposit: 300,
	monthly_rent: 400
)

two_bedrooms = ApartmentType.create(
	name: "Two Bedroom",
	code: "two_bedroom",
	initial_deposit: 400,
	monthly_rent: 500
)

three_bedrooms = ApartmentType.create(
	name: "Three Bedroom",
	code: "three_bedroom",
	initial_deposit: 500,
	monthly_rent: 700
)



#Generate Users
supervisor = User.create(
username: "SUPERVISOR", email: "supervisor@oars.com", password: "SUPERVISOR#", password_confirmation: "SUPERVISOR#", role_id: 4)
manager = User.create(
username: "MANAGER", email: "manager@oars.com", password: "MANAGER#", password_confirmation: "MANAGER#", role_id: 3)
assistant_one = User.create(
username: "ASSISTANT1", email: "assistant1@oars.com", password: "ASSISTANT1#", password_confirmation: "ASSISTANT1#", role_id: 2)
assistant_two = User.create(
username: "ASSISTANT2", email: "assistant2@oars.com", password: "ASSISTANT2#", password_confirmation: "ASSISTANT2#", role_id: 2)
assistant_three = User.create(
username: "ASSISTANT3", email: "assistant3@oars.com", password: "ASSISTANT3#", password_confirmation: "ASSISTANT3#", role_id: 2)


staff_supervisor = Staff.create(
  id: 230,
  first_name: "Susan",
	 last_name: "Brandon",
	 position: Staff.positions[:supervisor],
	 gender: Staff.genders[:female],
	 dob: "1977-03-10",
	 salary: 46_000,
	 user: supervisor
)

staff_manager = Staff.create(
  id: 220,
  first_name: "Terry",
	 last_name: "Ford",
	 position: Staff.positions[:manager],
	 gender: Staff.genders[:male],
	 dob: "1967-10-20",
	 salary: 53_000,
	 user: manager
)

staff_assistant_one = Staff.create(
  id: 200,
  first_name: "Joe",
	 last_name: "White",
	 position: Staff.positions[:assistant],
	 gender: Staff.genders[:male],
	 dob: "1982-07-08",
	 salary: 24_000,
	 user: assistant_one
)

staff_assistant_two = Staff.create(
  id: 210,
  first_name: "Ann",
	 last_name: "Tremble",
	 position: Staff.positions[:assistant],
	 gender: Staff.genders[:female],
	 dob: "1981-06-12",
	 salary: 26_000,
	 user: assistant_two
)

staff_assistant_three = Staff.create(
  id: 240,
  first_name: "Julia",
	 last_name: "Roberts",
	 position: Staff.positions[:assistant],
	 gender: Staff.genders[:female],
	 dob: "1982-09-12",
	 salary: 28_000,
	 user: assistant_three
)

# Create User Tenants
user_tenant_one = User.create(
  username: "TENANT1",
	email: "jack.robin@email.com",
	password: "TENANT1#",
	password_confirmation: "TENANT1#",
	role_id: Role.find_by_name("tenant")
)

user_tenant_two = User.create(
  username: "TENANT2",
	email: "mary.stackles@email.com",
	password: "TENANT2#",
	password_confirmation: "TENANT2#",
	role_id: Role.find_by_name("tenant")
)

user_tenant_three = User.create(
  username: "TENANT3",
	email: "ramu.reddy@email.com",
	password: "TENANT3#",
	password_confirmation: "TENANT3#",
	role_id: Role.find_by_name("tenant")
)

user_tenant_four = User.create(
  username: "TENANT4",
	email: "marion.black@email.com",
	password: "TENANT4#",
	password_confirmation: "TENANT4#",
	role_id: Role.find_by_name("tenant")
)

user_tenant_five = User.create(
  username: "TENANT5",
	email: "venessa.williams@gmail.com",
	password: "TENANT5#",
	password_confirmation: "TENANT5#",
	role_id: Role.find_by_name("tenant")
)

user_tenant_six = User.create(
  username: "TENANT6",
	email: "ai.anything@gmail.com",
	password: "TENANT6#",
	password_confirmation: "TENANT6#",
	role_id: Role.find_by_name("tenant")
 )

#Generate Tenants
tenant_one = Tenant.create(
  first_name: "Jack",
	last_name: "Robin",
	dob: "1960-06-21",
	marital_status: Tenant.marital_statuses[:married],
	work_phone: "417-345-2323",
	home_phone: "417-555-6565",
	employer: "Kraft Inc",
	gender: Tenant.genders[:male],
	user: user_tenant_one,
	ssn: Faker::Medical::SSN.ssn
)

tenant_two = Tenant.create(
  first_name: "Mary",
	last_name: "Stackles",
	dob: "1980-08-02",
	marital_status: Tenant.marital_statuses[:single],
	work_phone: "417-545-3320",
	home_phone: "417-666-7565",
	employer: "Kraft Inc",
	gender: Tenant.genders[:female],
	user: user_tenant_two,
	ssn: Faker::Medical::SSN.ssn
)

tenant_three = Tenant.create(
  first_name: "Ramu",
	last_name: "Reddy",
	dob: "1962-04-02",
	marital_status: Tenant.marital_statuses[:married],
	work_phone: "417-836-2323",
	home_phone: "417-222-0565",
	employer: "SMSU",
	gender: Tenant.genders[:male],
	user: user_tenant_three,
	ssn: Faker::Medical::SSN.ssn
)

tenant_four = Tenant.create(
  first_name: "Marion",
	last_name: "Black",
	dob: "1981-05-25",
	marital_status: Tenant.marital_statuses[:single],
	work_phone: "417-425-7766",
	home_phone: "417-677-2364",
	employer: "SMSU",
	gender: Tenant.genders[:male],
	user: user_tenant_four,
	ssn: Faker::Medical::SSN.ssn
)

tenant_five = Tenant.create(
  first_name: 'Venessa',
	last_name: "Williams",
	dob: "1970-03-12",
	marital_status: Tenant.marital_statuses[:married],
	work_phone: "417-555-7878",
	home_phone: "417-677-2364",
	employer: "Kraft Inc",
	gender: Tenant.genders[:female],
	user: user_tenant_five ,
	ssn: Faker::Medical::SSN.ssn
)

tenant_six = Tenant.create(
  first_name: 'Ai',
	last_name: "Anything",
	dob: "1922-12-22",
	marital_status: Tenant.marital_statuses[:single],
	work_phone: "281-323-9222",
	home_phone: "281-323-9211",
	employer: "NetIQ",
	gender: Tenant.genders[:female],
	user: user_tenant_six,
	ssn: Faker::Medical::SSN.ssn
)

tenants = [tenant_one,
	tenant_two,
	tenant_three,
	tenant_four,
	tenant_five,
	tenant_six]

apartment_one = Apartment.create(
  number: 100,
  apartment_type: studio,
	status: Apartment.statuses[:rented]
)

apartment_two = Apartment.create(
  number: 101,
  apartment_type: studio,
	status: Apartment.statuses[:rented]
)

apartment_three = Apartment.create(
  number: 102,
  apartment_type: studio,
	status: Apartment.statuses[:rented]
)

apartment_four = Apartment.create(
  number: 103,
  apartment_type: one_bedroom,
	status: Apartment.statuses[:vacant]
)

apartment_five = Apartment.create(
  number: 104,
  apartment_type: one_bedroom,
	status: Apartment.statuses[:rented]
)

apartment_six = Apartment.create(
  number: 200,
  apartment_type: two_bedrooms,
	status: Apartment.statuses[:vacant]
)

apartment_seven = Apartment.create(
  number: 201,
  apartment_type: two_bedrooms,
	status: Apartment.statuses[:rented]
)

apartment_eight = Apartment.create(
  number: 202,
  apartment_type: three_bedrooms,
	status: Apartment.statuses[:vacant]
)

apartment_nine = Apartment.create(
  number: 203,
  apartment_type: three_bedrooms,
	status: Apartment.statuses[:rented]
)


# Generate Rental
rental_one = Rental.create(
  sign_date: "2001-05-12",
	status: Rental.statuses[:occupied],
	lease_type: Rental.lease_types[:one_year],
	lease_start: "2001-06-01",
	lease_end: "2003-06-30",
	renewal_date: "2003-03-31",
	has_utility: true,
	deposit_amount: 400,
	rent_amount: 500,
	tenant: tenant_one,
	apartment: apartment_seven,
  staff_id: 200
)

rental_two = Rental.create(
  sign_date: "2001-05-21",
	status: Rental.statuses[:occupied],
	lease_type: Rental.lease_types[:six_months],
	lease_start: "2001-06-01",
	lease_end: "2003-06-30",
	renewal_date: "2003-03-31",
	has_utility: true,
	deposit_amount: 200,
	rent_amount: 300,
	tenant: tenant_two,
	apartment: apartment_three,
  staff_id: 220
)

rental_three = Rental.create(
  sign_date: "2001-10-12",
	status: Rental.statuses[:occupied],
	lease_type: Rental.lease_types[:six_months],
	lease_start: "2001-11-01",
	lease_end: "2003-07-30",
	renewal_date: "2003-07-30",
	has_utility: true,
	deposit_amount: 500,
	rent_amount: 700,
	tenant: tenant_three,
	apartment: apartment_nine,
  staff_id: 240
)

rental_four = Rental.create(
  sign_date: "2001-03-06",
	status: Rental.statuses[:occupied],
	lease_type: Rental.lease_types[:one_year],
	lease_start: "2002-04-01",
	lease_end: "2003-01-30",
	renewal_date: "2003-01-31",
	has_utility: false,
	deposit_amount: 200,
	rent_amount: 300,
	tenant: tenant_four,
	apartment: apartment_two,
  staff_id: 210
)

rental_five = Rental.create(
  sign_date: "2001-04-15",
	status: Rental.statuses[:occupied],
	lease_type: Rental.lease_types[:one_year],
	lease_start: "2002-05-01",
	lease_end: "2003-02-28",
	renewal_date: "2003-02-28",
	has_utility: true,
	deposit_amount: 300,
	rent_amount: 400,
	tenant: tenant_five,
	apartment: apartment_five,
  staff_id: 220
)

rental_six = Rental.create(
  sign_date: "2001-07-15",
	status: Rental.statuses[:signed_not_occupied],
	lease_type: Rental.lease_types[:one_year],
	lease_start: "2002-08-01",
	lease_end: "2003-06-30",
	renewal_date: "2003-06-30",
	has_utility: true,
	deposit_amount: 200,
	rent_amount: 300,
	tenant: tenant_six,
	apartment: apartment_one,
  staff_id: 200
)


# Generate Complaints
complaint_one = Complaint.create(
  date_filed: "2001-06-21",
	complaintable_id: apartment_nine.id,
  complaintable_type: apartment_nine.class.to_s,
	content: "kitchen sink clogged",
	status:  Complaint.statuses[:fixed],
	user: user_tenant_three
)

complaint_two = Complaint.create(
  date_filed: "2001-08-17",
	complaintable_id: apartment_five.id,
  complaintable_type: apartment_five.class.to_s,
	content: "water heater not working",
	status: Complaint.statuses[:fixed],
	user: user_tenant_five
)

complaint_three = Complaint.create(
  date_filed: "2002-07-17",
	complaintable_id: apartment_five.id,
  complaintable_type: apartment_five.class.to_s,
	content: "room heater problem",
	status: Complaint.statuses[:fixed],
	user: user_tenant_five
)

complaint_four = Complaint.create(
  date_filed: "2002-07-21",
	content: "air conditioning not working",
  complaintable_id: Apartment.find_by_number(103).id,
  complaintable_type: Apartment.to_s,
	status: Complaint.statuses[:not_determined],
	user: supervisor
)

complaint_five = Complaint.create(
  date_filed: "2002-10-20",
	complaintable_id: apartment_nine.id,
  complaintable_type: apartment_nine.class.to_s,
	content: "car parking not proper",
	status: Complaint.statuses[:not_determined],
	user: user_tenant_three
)

complaint_six = Complaint.create(
  date_filed: "2002-10-20",
	complaintable_id: apartment_three.id,
	content: "delay in payment",
	status: Complaint.statuses[:fixed],
	user: user_tenant_two
)

complaint_seven = Complaint.create(
  date_filed: "2002-10-20",
	content: "utility not working",
  complaintable_id: Apartment.find_by_number(202).id,
  complaintable_type: Apartment.to_s,
	status: Complaint.statuses[:not_determined],
	user: supervisor
)


# Generate Auto
tenant_auto_one = TenantAuto.create(
  license_number: "SYK332",
	auto_make: "Ford",
	auto_model: "Taurus",
	auto_year: 1999,
	auto_color: "Red",
	rental: rental_one
)

tenant_auto_two = TenantAuto.create(
  license_number: "TTS430",
	auto_make: "Volvo",
	auto_model: "GL 740",
	auto_year: 1990,
	auto_color: "Green",
	rental: rental_one
)

tenant_auto_three = TenantAuto.create(
  license_number: "ABC260",
	auto_make: "Toyota",
	auto_model: "Lexus",
	auto_year: 2000,
	auto_color: "Maroon",
	rental: rental_two
)

tenant_auto_four = TenantAuto.create(
  license_number: "LLT322",
	auto_make: "Honda",
	auto_model: "Accord",
	auto_year: 2001,
	auto_color: "Blue",
	rental: rental_three
)

tenant_auto_five = TenantAuto.create(
  license_number: "KYK100",
	auto_make: "Toyota",
	auto_model: "Camry",
	auto_year: 1999,
	auto_color: "Black",
	rental: rental_three
)

tenant_auto_six = TenantAuto.create(
  license_number: "FLT232",
	auto_make: "Honda",
	auto_model: "Civic",
	auto_year: 1999,
	auto_color: "Red",
	rental: rental_four
)

tenant_auto_seven = TenantAuto.create(
  license_number: "LLT668",
	auto_make: "Volvo",
	auto_model: "GL 980",
	auto_year: 2000,
	auto_color: "Velvet",
	rental: rental_five
)


# Generate Family
tenant_family_member_one = TenantFamilyMember.create(
  ss: "444-663-434",
	name: "Kay Robin",
	member_type: TenantFamilyMember.member_types[:spouse],
	marital_status: TenantFamilyMember.marital_statuses[:married],
	gender: TenantFamilyMember.genders[:female],
	dob: "1965-06-21",
	rental: rental_one
)

tenant_family_member_two = TenantFamilyMember.create(
  ss: "222-664-343",
	name: "Saria Reddy",
	member_type: TenantFamilyMember.member_types[:spouse],
	marital_status: TenantFamilyMember.marital_statuses[:married],
	gender: TenantFamilyMember.genders[:female],
	dob: "1965-06-11",
	rental: rental_three
)

tenant_family_member_two = TenantFamilyMember.create(
  ss: "222-663-434",
	name: "Anjali Reddy",
	member_type: TenantFamilyMember.member_types[:child],
	marital_status: TenantFamilyMember.marital_statuses[:married],
	gender: TenantFamilyMember.genders[:female],
	dob: "1990-08-10",
	rental: rental_three
)

tenant_family_member_two = TenantFamilyMember.create(
  ss: "111-444-663",
	name: "Terry Williams",
	member_type: TenantFamilyMember.member_types[:spouse],
	marital_status: TenantFamilyMember.marital_statuses[:married],
	gender: TenantFamilyMember.genders[:female],
	dob: "1968-03-21",
	rental: rental_five
)

tenant_family_member_two = TenantFamilyMember.create(
  ss: "232-446-634",
	name: "Tom Williams",
	member_type: TenantFamilyMember.member_types[:spouse],
	marital_status: TenantFamilyMember.marital_statuses[:married],
	gender: TenantFamilyMember.genders[:male],
	dob: "1991-05-20",
	rental: rental_five
)


# Generate Rental invoice due
rental_invoice_one = RentalInvoice.create(
    number: 1000,
	 invoice_date: "2001-03-12",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_two = RentalInvoice.create(
    number: 1001,
	 invoice_date: "2001-04-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_three = RentalInvoice.create(
  number: 1002,
	 invoice_date: "2001-05-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_four = RentalInvoice.create(
  number: 1003,
	 invoice_date: "2001-06-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_five = RentalInvoice.create(
  number: 1004,
	 invoice_date: "2001-07-30",
	 cc_number: "1234567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_six = RentalInvoice.create(
  number: 1005,
	 invoice_date: "2001-08-30",
	 cc_number: "1234567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_seven = RentalInvoice.create(
  number: 1006,
	 invoice_date: "2001-07-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_eight = RentalInvoice.create(
  number: 1007,
	 invoice_date: "2001-10-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_nine = RentalInvoice.create(
    number: 1008,
	 invoice_date: "2001-11-30",
	 cc_number: "1234567890123450",
	 cc_type: "visa",
	 cc_expiration_date: "1-Dec-02",
	 rental: rental_one,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)

rental_invoice_ten = RentalInvoice.create(
  number: 1009,
	 invoice_date: "2001-05-21",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_eleven = RentalInvoice.create(
  number: 1010,
	 invoice_date: "2001-06-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_twelve = RentalInvoice.create(
  number: 1011,
	 invoice_date: "2001-07-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_thirteen = RentalInvoice.create(
  number: 1012,
	 invoice_date: "2001-08-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_fourteen = RentalInvoice.create(
  number: 1013,
	 invoice_date: "2001-09-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_fifteen = RentalInvoice.create(
  number: 1014,
	 invoice_date: "2001-10-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_sixteen = RentalInvoice.create(
  number: 1015,
	 invoice_date: "2001-11-30",
	 cc_number: "3343567890123450",
	 cc_type: "mastercard",
	 cc_expiration_date: "1-Oct-03",
	 rental: rental_two,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)

rental_invoice_seventeen = RentalInvoice.create(
  number: 1016,
	 invoice_date: "2001-10-12",
	 cc_number: "8654567890123290",
	 cc_type: "discover",
	 cc_expiration_date: "1-Nov-03",
	 rental: rental_three,
	 note: "Rental Invoice",
   amount: 700,
	 cc_amount_charged: 700
)
rental_invoice_eighteen = RentalInvoice.create(
  number: 1017,
	 invoice_date: "2001-11-30",
	 cc_number: "8654567890123290",
	 cc_type: "discover",
	 cc_expiration_date: "1-Nov-03",
	 rental: rental_three,
	 note: "Rental Invoice",
   amount: 700,
	 cc_amount_charged: 700
)

rental_invoice_nineteen = RentalInvoice.create(
  number: 1018,
	 invoice_date: "2002-03-06",
	 cc_number: "7766567890123200",
	 cc_type: "visa",
	 cc_expiration_date: "1-Sep-03",
	 rental: rental_four,
	 note: "Rental Invoice",
   amount: 500,
	 cc_amount_charged: 500
)
rental_invoice_twenty = RentalInvoice.create(
  number: 1019,
	 invoice_date: "2002-04-30",
	 cc_number: "7766567890123200",
	 cc_type: "visa",
	 cc_expiration_date: "1-Sep-03",
	 rental: rental_four,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_twentyone = RentalInvoice.create(
  number: 1020,
	 invoice_date: "2002-05-30",
	 cc_number: "7766567890123200",
	 cc_type: "visa",
	 cc_expiration_date: "1-Sep-03",
	 rental: rental_four,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_twentytwo = RentalInvoice.create(
  number: 1021,
	 invoice_date: "2002-06-30",
	 cc_number: "7766567890123200",
	 cc_type: "visa",
	 cc_expiration_date: "1-Sep-03",
	 rental: rental_four,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)
rental_invoice_twentythree = RentalInvoice.create(
  number: 1022,
	 invoice_date: "2002-07-30",
	 cc_number: "7766567890123200",
	 cc_type: "visa",
	 cc_expiration_date: "1-Sep-03",
	 rental: rental_four,
	 note: "Rental Invoice",
   amount: 300,
	 cc_amount_charged: 300
)

rental_invoice_twentyfour = RentalInvoice.create(
  number: 1023,
	 invoice_date: "2002-04-15",
	 cc_number: "6599567890126210",
	 cc_type: "discover",
	 cc_expiration_date: "1-Dec-03",
	 rental: rental_five ,
	 note: "Rental Invoice",
   amount: 700,
	 cc_amount_charged: 700
)
rental_invoice_twentyfive = RentalInvoice.create(
  number: 1024,
	 invoice_date: "2002-05-30",
	 cc_number: "6599567890126210",
	 cc_type: "discover",
	 cc_expiration_date: "1-Dec-03",
	 rental: rental_five ,
	 note: "Rental Invoice",
   amount: 400,
	 cc_amount_charged: 400
)
rental_invoice_twentysix = RentalInvoice.create(
  number: 1025,
	 invoice_date: "2002-06-30",
	 cc_number: "6599567890126210",
	 cc_type: "discover",
	 cc_expiration_date: "1-Dec-03",
	 rental: rental_five ,
	 note: "Rental Invoice",
   amount: 400,
	 cc_amount_charged: 400
)
rental_invoice_twentyseven = RentalInvoice.create(
  number: 1026,
	 invoice_date: "2002-07-30",
	 cc_number: "6599567890126210",
	 cc_type: "discover",
	 cc_expiration_date: "1-Dec-03",
	 rental: rental_five,
	 note: "Rental Invoice",
   amount: 400,
	 cc_amount_charged: 400
)

# Generate Testimonial
testimonial_one = Testimonial.create(
date_entered: "31-Mar-02", content: "I really like TEAM1OARS Online Apartment Rental System!", tenant: tenant_one )
testimonial_two = Testimonial.create(
date_entered: "9-Apr-02", content: "I think that this TEAM1OARS website can be improved!", tenant: tenant_three )
testimonial_three = Testimonial.create(
date_entered: "25-Apr-02", content: "I believe that the Tenants and Visitors will like TEAM1OARS since they can rent and manage apartments online. ", tenant: tenant_five )

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
    apartment: apartment,
    staff: Staff.find_by_id(210)
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

  RentalInvoice.create(invoice_date: Date.today, rental: rental, amount: rental.deposit_amount, note: "Initial Deposit")

  rental_invoice = RentalInvoice.create(
    invoice_date: rental.lease_start,
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
