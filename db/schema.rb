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

ActiveRecord::Schema.define(version: 20151212022206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "session_id"
    t.string   "payment_method"
    t.integer  "payment_amount"
    t.string   "payment_currency"
    t.string   "payment_url"
    t.datetime "paid_at"
    t.boolean  "attended"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "attendees", ["member_id"], name: "index_attendees_on_member_id", using: :btree
  add_index "attendees", ["session_id", "member_id"], name: "index_attendees_on_session_id_and_member_id", unique: true, using: :btree
  add_index "attendees", ["session_id"], name: "index_attendees_on_session_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.integer  "location_id"
    t.date     "starts_at"
    t.date     "ends_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["type"], name: "index_events_on_type", using: :btree

  create_table "guests", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "session_id"
    t.string   "role"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "guests", ["teacher_id", "session_id"], name: "index_guests_on_teacher_id_and_session_id", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "address_line"
    t.string   "extended_address"
    t.string   "city"
    t.string   "region_code"
    t.string   "postal_code"
    t.string   "image_url"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "category"
    t.integer  "event_location_id"
    t.boolean  "safe_space"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "guest_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "ticket_cost"
    t.string   "ticket_currency"
    t.integer  "max_attendees"
    t.integer  "event_id"
    t.string   "sku"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "sessions", ["event_id"], name: "index_sessions_on_event_id", using: :btree
  add_index "sessions", ["sku"], name: "index_sessions_on_sku", unique: true, using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
