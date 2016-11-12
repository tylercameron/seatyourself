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

ActiveRecord::Schema.define(version: 20161112191338) do

  create_table "reservations", force: :cascade do |t|
    t.string   "date_of_reservation"
    t.time     "time_of_reservation"
    t.integer  "number_of_seats"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cuisine"
    t.string   "price"
    t.string   "street_address"
    t.string   "neighbourhood"
    t.integer  "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
