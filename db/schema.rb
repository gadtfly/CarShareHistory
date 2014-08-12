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

ActiveRecord::Schema.define(version: 20140812024755) do

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", force: true do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["location_id"], name: "index_observations_on_location_id"

  create_table "vehicle_observations", force: true do |t|
    t.string  "address"
    t.string  "fuel"
    t.string  "interior"
    t.string  "exterior"
    t.float   "lat"
    t.float   "long"
    t.integer "observation_id"
    t.string  "vehicle_id"
  end

  add_index "vehicle_observations", ["observation_id"], name: "index_vehicle_observations_on_observation_id"

  create_table "vehicles", id: false, force: true do |t|
    t.string   "id",            null: false
    t.string   "license_plate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["id"], name: "index_vehicles_on_id", unique: true

end
