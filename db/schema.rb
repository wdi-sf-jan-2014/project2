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

ActiveRecord::Schema.define(version: 20140225032303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "funcheap_results", force: true do |t|
    t.text     "name"
    t.text     "full_address"
    t.text     "date"
    t.string   "logo"
    t.string   "rating_img"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcheaps", force: true do |t|
    t.text     "event_title"
    t.text     "address"
    t.text     "date"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "itinerary_id"
  end

  add_index "funcheaps", ["itinerary_id"], name: "index_funcheaps_on_itinerary_id", using: :btree

  create_table "funcheaps_itineraries", force: true do |t|
    t.integer  "funcheap_id"
    t.integer  "itinerary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funcheaps_itineraries", ["funcheap_id"], name: "index_funcheaps_itineraries_on_funcheap_id", using: :btree
  add_index "funcheaps_itineraries", ["itinerary_id"], name: "index_funcheaps_itineraries_on_itinerary_id", using: :btree

  create_table "itineraries", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "restaurant_results", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "full_address"
    t.string   "phone"
    t.string   "website"
    t.string   "logo"
    t.string   "rating_img"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "full_address"
    t.string   "phone"
    t.string   "website"
    t.string   "logo"
    t.string   "rating_img"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "itinerary_id"
  end

  add_index "restaurants", ["itinerary_id"], name: "index_restaurants_on_itinerary_id", using: :btree

  create_table "restaurants_itineraries", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "itinerary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants_itineraries", ["itinerary_id"], name: "index_restaurants_itineraries_on_itinerary_id", using: :btree
  add_index "restaurants_itineraries", ["restaurant_id"], name: "index_restaurants_itineraries_on_restaurant_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "yelpfinds", force: true do |t|
    t.string   "searchterm"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "searchradius"
    t.integer  "resultslimit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
