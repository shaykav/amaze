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

ActiveRecord::Schema.define(version: 20171216194443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "photo"
    t.string "latitude"
    t.string "longitude"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_locations_on_itinerary_id"
  end

  create_table "neighborhood_itineraries", force: :cascade do |t|
    t.bigint "neighborhood_id"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_neighborhood_itineraries_on_itinerary_id"
    t.index ["neighborhood_id"], name: "index_neighborhood_itineraries_on_neighborhood_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_id", "reviewable_type"], name: "index_reviews_on_reviewable_id_and_reviewable_type"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "itineraries", "users"
  add_foreign_key "locations", "itineraries"
  add_foreign_key "neighborhood_itineraries", "itineraries"
  add_foreign_key "neighborhood_itineraries", "neighborhoods"
end
