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

ActiveRecord::Schema[7.0].define(version: 2022_09_27_234409) do
  create_table "baggages", force: :cascade do |t|
    t.integer "weight"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "reservation_id", null: false
    t.index ["reservation_id"], name: "index_baggages_on_reservation_id"
    t.index ["user_id"], name: "index_baggages_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.integer "flight_class"
    t.string "manufacturer"
    t.string "source"
    t.string "destination"
    t.integer "capacity"
    t.integer "passengers"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "capacity > 0", name: "capacity_check"
    t.check_constraint "cost > 0", name: "cost_check"
    t.check_constraint "passengers <= capacity", name: "passengers_check"
    t.check_constraint "source != destination", name: "source_destination_check"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "passengers"
    t.integer "ticket_class"
    t.integer "amenities"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "flight_id", null: false
    t.index ["flight_id"], name: "index_reservations_on_flight_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.check_constraint "cost > 0", name: "cost_check"
    t.check_constraint "passengers > 0", name: "passengers_check"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "name"
    t.string "credit_card"
    t.string "address"
    t.string "mobile"
    t.string "email"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "baggages", "reservations"
  add_foreign_key "baggages", "users"
  add_foreign_key "reservations", "flights"
  add_foreign_key "reservations", "users"
  create_trigger("reservations_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("reservations").
      after(:insert) do
    "UPDATE flights SET passengers = passengers + NEW.passengers WHERE id = NEW.flight_id;"
  end

  create_trigger("reservations_after_update_row_tr", :generated => true, :compatibility => 1).
      on("reservations").
      after(:update) do
    "UPDATE flights SET passengers = passengers + NEW.passengers - OLD.passengers WHERE id = NEW.flight_id;"
  end

  create_trigger("reservations_after_delete_row_tr", :generated => true, :compatibility => 1).
      on("reservations").
      after(:delete) do
    "UPDATE flights SET passengers = passengers - OLD.passengers WHERE id = OLD.flight_id;"
  end

end
