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

ActiveRecord::Schema.define(version: 20140812023012) do

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_observations", force: true do |t|
    t.string   "address"
    t.string   "fuel"
    t.string   "interior"
    t.string   "exterior"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "vehicle_id"
  end

  add_index "vehicle_observations", ["location_id"], name: "index_vehicle_observations_on_location_id"
  add_index "vehicle_observations", ["vehicle_id"], name: "index_vehicle_observations_on_vehicle_id"

  create_table "vehicles", id: false, force: true do |t|
    t.string   "id",            null: false
    t.string   "license_plate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["id"], name: "index_vehicles_on_id", unique: true

end
