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

ActiveRecord::Schema.define(version: 20160523065659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixes", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "supplier_id"
    t.integer  "code"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "localization"
    t.string   "comment"
    t.boolean  "check",                default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "fixes", ["supplier_id"], name: "index_fixes_on_supplier_id", using: :btree
  add_index "fixes", ["work_id"], name: "index_fixes_on_work_id", using: :btree

  create_table "supplier_reviews", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "supplier_id"
    t.integer  "projected_budget"
    t.integer  "final_budget"
    t.integer  "user_valoration"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "supplier_reviews", ["supplier_id"], name: "index_supplier_reviews_on_supplier_id", using: :btree
  add_index "supplier_reviews", ["work_id"], name: "index_supplier_reviews_on_work_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "guild"
    t.string   "email"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "phone_number_1"
    t.integer  "phone_number_2"
    t.integer  "fax_number"
    t.string   "web_page"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "suppliers", ["user_id"], name: "index_suppliers_on_user_id", using: :btree

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
    t.string   "name"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "phone_number_1"
    t.integer  "phone_number_2"
    t.integer  "fax_number"
    t.string   "web_page"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "code"
    t.string   "name"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "client"
    t.integer  "client_phone"
    t.string   "client_email"
    t.string   "client_address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

end
