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

ActiveRecord::Schema.define(version: 20160328013131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.integer  "apt_type"
    t.integer  "apt_status"
    t.boolean  "apt_utility"
    t.float    "apt_deposit_amt"
    t.float    "apt_rent_amt"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.date     "complaint_date"
    t.text     "rental_complaint"
    t.text     "apt_complaint"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rental_invoices", force: :cascade do |t|
    t.integer  "invoice_no"
    t.date     "invoice_date"
    t.date     "invoice_due_date"
    t.string   "cc_no"
    t.string   "cc_type"
    t.string   "cc_exp_date"
    t.float    "cc_amt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "rental_no"
    t.date     "rental_date"
    t.string   "status"
    t.date     "cancel_date"
    t.string   "lease_type"
    t.date     "lease_start"
    t.date     "lease_end"
    t.date     "renewal_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position"
    t.string   "gender"
    t.date     "dob"
    t.integer  "salary"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_families", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "spouse"
    t.string   "child"
    t.boolean  "divorced"
    t.boolean  "single"
    t.string   "gender"
    t.date     "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenantautos", force: :cascade do |t|
    t.string   "license_no"
    t.string   "auto_make"
    t.string   "auto_model"
    t.string   "auto_year"
    t.string   "auto_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "marital_status"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "employer"
    t.string   "gender"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.date     "date"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
