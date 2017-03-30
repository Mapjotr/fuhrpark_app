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

ActiveRecord::Schema.define(version: 20170329171321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "car_name"
    t.string   "car_model"
    t.float    "purchase_price"
    t.date     "purchase_date"
    t.string   "seller"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "car_brand"
    t.date     "registrationdate"
    t.integer  "milage_purchase_date"
    t.string   "fuel_type"
    t.integer  "cubic_capacity"
    t.integer  "engine_power"
    t.string   "numberplate"
    t.string   "emission_class"
    t.string   "insurance_nr"
    t.string   "sf_class"
    t.integer  "sf_perc"
    t.float    "liability"
    t.float    "comprehensive_part"
    t.float    "comprehensive_full"
    t.float    "tax"
    t.boolean  "sold"
    t.date     "sold_date"
    t.integer  "sale_price"
    t.string   "buyer"
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_cars_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "refuellings", force: :cascade do |t|
    t.date     "refuel_date"
    t.integer  "milage"
    t.integer  "cents_per_liter"
    t.string   "filling_station"
    t.string   "location"
    t.float    "liters"
    t.integer  "car_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "filled_up"
    t.index ["car_id", "created_at"], name: "index_refuellings_on_car_id_and_created_at", using: :btree
    t.index ["car_id"], name: "index_refuellings_on_car_id", using: :btree
  end

  create_table "repairs", force: :cascade do |t|
    t.date     "repair_date"
    t.string   "title"
    t.string   "description"
    t.float    "billings_amount"
    t.text     "garage"
    t.integer  "car_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["car_id", "created_at"], name: "index_repairs_on_car_id_and_created_at", using: :btree
    t.index ["car_id"], name: "index_repairs_on_car_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "cars", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "refuellings", "cars"
  add_foreign_key "repairs", "cars"
end
