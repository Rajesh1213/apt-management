# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160421044538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.integer  "apartment_type"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "apartments", ["apartment_type"], name: "index_apartments_on_apartment_type", using: :btree
  add_index "apartments", ["status"], name: "index_apartments_on_status", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.date     "date_filed"
    t.text     "rental_complaint"
    t.text     "apartment_complaint"
    t.integer  "status"
    t.integer  "complaintable_id"
    t.string   "complaintable_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "complaints", ["complaintable_type", "complaintable_id"], name: "index_complaints_on_complaintable_type_and_complaintable_id", using: :btree
  add_index "complaints", ["status"], name: "index_complaints_on_status", using: :btree

  create_table "rental_invoices", force: :cascade do |t|
    t.date     "invoice_date"
    t.date     "invoice_due"
    t.string   "cc_number"
    t.string   "cc_type"
    t.string   "cc_expiration_date"
    t.decimal  "cc_amount_charged"
    t.integer  "rental_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "rental_invoices", ["rental_id"], name: "index_rental_invoices_on_rental_id", using: :btree

  create_table "rentals", force: :cascade do |t|
    t.date     "sign_date"
    t.integer  "status"
    t.date     "cancel_date"
    t.integer  "lease_type"
    t.date     "lease_start"
    t.date     "lease_end"
    t.date     "renewal_date"
    t.boolean  "has_utility"
    t.decimal  "deposit_amount"
    t.decimal  "rent_amount"
    t.integer  "tenant_id"
    t.integer  "apartment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rentals", ["apartment_id"], name: "index_rentals_on_apartment_id", using: :btree
  add_index "rentals", ["lease_type"], name: "index_rentals_on_lease_type", using: :btree
  add_index "rentals", ["status"], name: "index_rentals_on_status", using: :btree
  add_index "rentals", ["tenant_id"], name: "index_rentals_on_tenant_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position"
    t.integer  "gender"
    t.date     "dob"
    t.integer  "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "staffs", ["gender"], name: "index_staffs_on_gender", using: :btree
  add_index "staffs", ["position"], name: "index_staffs_on_position", using: :btree
  add_index "staffs", ["user_id"], name: "index_staffs_on_user_id", using: :btree

  create_table "tenant_autos", force: :cascade do |t|
    t.string   "license_number"
    t.string   "auto_make"
    t.string   "auto_model"
    t.string   "auto_year"
    t.string   "auto_color"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "rental_id"
  end

  add_index "tenant_autos", ["rental_id"], name: "index_tenant_autos_on_rental_id", using: :btree

  create_table "tenant_family_members", force: :cascade do |t|
    t.string   "ss"
    t.string   "name"
    t.integer  "member_type"
    t.integer  "marital_status"
    t.integer  "gender"
    t.date     "dob"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "rental_id"
  end

  add_index "tenant_family_members", ["gender"], name: "index_tenant_family_members_on_gender", using: :btree
  add_index "tenant_family_members", ["marital_status"], name: "index_tenant_family_members_on_marital_status", using: :btree
  add_index "tenant_family_members", ["member_type"], name: "index_tenant_family_members_on_member_type", using: :btree
  add_index "tenant_family_members", ["rental_id"], name: "index_tenant_family_members_on_rental_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "marital_status"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "employer"
    t.integer  "gender"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "tenants", ["marital_status"], name: "index_tenants_on_marital_status", using: :btree
  add_index "tenants", ["user_id"], name: "index_tenants_on_user_id", using: :btree

  create_table "testimonials", force: :cascade do |t|
    t.date     "date_entered"
    t.text     "content"
    t.integer  "rental_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "testimonials", ["rental_id"], name: "index_testimonials_on_rental_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.integer  "staff_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["staff_id"], name: "index_users_on_staff_id", using: :btree

  add_foreign_key "staffs", "users"
  add_foreign_key "tenants", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "staffs"
end
