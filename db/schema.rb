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

ActiveRecord::Schema.define(version: 20180118124940) do

  create_table "audis", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.integer  "no_of_seats",   limit: 4
    t.integer  "movie_hall_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audis", ["movie_hall_id"], name: "fk_rails_f7790d095f", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.datetime "date_of_movie"
    t.integer  "no_of_persons", limit: 4
    t.decimal  "amount",                    precision: 10
    t.string   "seats_alloted", limit: 255
    t.integer  "user_id",       limit: 4
    t.integer  "ticket_id",     limit: 4
    t.integer  "movie_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["movie_id"], name: "fk_rails_b8ab10f4c9", using: :btree
  add_index "bookings", ["ticket_id"], name: "fk_rails_12c5c2b89f", using: :btree
  add_index "bookings", ["user_id"], name: "fk_rails_ef0571f117", using: :btree

  create_table "movie_halls", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "duration",      limit: 255
    t.string   "movie_type",    limit: 255
    t.string   "genre",         limit: 255
    t.boolean  "is_bollywood",                             default: true
    t.decimal  "rating",                    precision: 10
    t.integer  "movie_hall_id", limit: 4
    t.integer  "audi_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["movie_hall_id"], name: "fk_rails_56482f2a6f", using: :btree

  create_table "show_times", force: :cascade do |t|
    t.string   "time",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "code",              limit: 255
    t.string   "seat_no",           limit: 255
    t.integer  "type_of_ticket_id", limit: 4
    t.integer  "show_time_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["show_time_id"], name: "fk_rails_38b233630d", using: :btree
  add_index "tickets", ["type_of_ticket_id"], name: "fk_rails_58757a9a09", using: :btree

  create_table "type_of_tickets", force: :cascade do |t|
    t.string   "type_of_ticket", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "address",       limit: 255
    t.string   "city",          limit: 255
    t.string   "phone_no",      limit: 255
    t.integer  "movie_hall_id", limit: 4
    t.integer  "audi_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["audi_id"], name: "fk_rails_b0718b609f", using: :btree
  add_index "users", ["movie_hall_id"], name: "fk_rails_191be361b5", using: :btree

  add_foreign_key "audis", "movie_halls"
  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "tickets"
  add_foreign_key "bookings", "users"
  add_foreign_key "movies", "movie_halls"
  add_foreign_key "tickets", "show_times"
  add_foreign_key "tickets", "type_of_tickets"
  add_foreign_key "users", "audis"
  add_foreign_key "users", "movie_halls"
end
