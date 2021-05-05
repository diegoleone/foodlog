# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_28_134124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.float "size"
    t.float "weight"
    t.integer "power"
    t.integer "year"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "model", default: "sedan"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doors", force: :cascade do |t|
    t.integer "status"
    t.string "color"
    t.boolean "automatic_window_supported"
    t.integer "vehicle_frame_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "meal_type"
    t.integer "calories"
    t.integer "proteins"
    t.integer "carbohydrates"
    t.integer "fats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.integer "user_id"
  end

  create_table "seat_belts", force: :cascade do |t|
    t.integer "status"
    t.string "material"
    t.integer "seat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer "status"
    t.string "color"
    t.boolean "removable"
    t.integer "vehicle_frame_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_email"
    t.string "password_digest"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

  create_table "vehicle_frames", force: :cascade do |t|
    t.float "size"
    t.float "weight"
    t.integer "status"
    t.integer "car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color", default: "white"
  end

  create_table "wheels", force: :cascade do |t|
    t.integer "status"
    t.float "size"
    t.integer "vehicle_frame_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "windows", force: :cascade do |t|
    t.integer "status"
    t.float "size"
    t.string "color"
    t.integer "vehicle_frame_id"
    t.integer "door_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
