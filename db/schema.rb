# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_21_011857) do
  create_table "baggages", force: :cascade do |t|
    t.string "baggage_id"
    t.integer "weight"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "reservation_id", null: false
    t.index ["baggage_id"], name: "index_baggages_on_baggage_id", unique: true
    t.index ["reservation_id"], name: "index_baggages_on_reservation_id"
    t.index ["user_id"], name: "index_baggages_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_id"
    t.string "name"
    t.integer "class"
    t.string "manufacturer"
    t.string "source"
    t.string "destination"
    t.integer "capacity"
    t.integer "status"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_flights_on_flight_id", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.string "confirmation_number"
    t.string "ticket_class"
    t.integer "number_of_passengers"
    t.integer "class"
    t.integer "amenities"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "flight_id", null: false
    t.integer "baggages_id", null: false
    t.index ["baggages_id"], name: "index_reservations_on_baggages_id"
    t.index ["confirmation_number"], name: "index_reservations_on_confirmation_number", unique: true
    t.index ["flight_id"], name: "index_reservations_on_flight_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "name"
    t.string "credit_card"
    t.string "address"
    t.string "mobile"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "baggages_id", null: false
    t.index ["baggages_id"], name: "index_users_on_baggages_id"
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "baggages", "reservations"
  add_foreign_key "baggages", "users"
  add_foreign_key "reservations", "baggages", column: "baggages_id"
  add_foreign_key "reservations", "flights"
  add_foreign_key "reservations", "users"
  add_foreign_key "users", "baggages", column: "baggages_id"
end
