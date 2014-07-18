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

ActiveRecord::Schema.define(version: 20140718212032) do

  create_table "assets", force: true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "handle_patient_visits", force: true do |t|
    t.integer  "user_id"
    t.integer  "visit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_conditions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_medical_conditions", force: true do |t|
    t.boolean  "patient_affected"
    t.boolean  "family_affected"
    t.integer  "patient_id"
    t.integer  "medical_condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_visit_reasons", force: true do |t|
    t.integer  "visit_id"
    t.integer  "reason_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone1"
    t.string   "phone2"
    t.integer  "salutation_id"
    t.string   "email1"
    t.string   "email2"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reasons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salutations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "type",                   default: "Employee"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "license_num"
    t.string   "title_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", force: true do |t|
    t.datetime "date_visit"
    t.date     "length_since_last_visit"
    t.integer  "lens_use_per_day"
    t.boolean  "lens_first_use"
    t.boolean  "dilation_consent"
    t.boolean  "privacy_consent"
    t.text     "test_result"
    t.integer  "patient_id"
    t.text     "current_meds"
    t.boolean  "med_allergy"
    t.text     "med_allergy_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
