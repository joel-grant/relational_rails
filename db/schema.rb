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

ActiveRecord::Schema.define(version: 2021_12_01_232952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.boolean "accepting_orders"
    t.integer "years_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dojos", force: :cascade do |t|
    t.string "name"
    t.boolean "open"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.boolean "payroll"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dojo_id"
    t.index ["dojo_id"], name: "index_instructors_on_dojo_id"
  end

  create_table "seeds", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_seeds_on_company_id"
  end

  add_foreign_key "instructors", "dojos"
  add_foreign_key "seeds", "companies"
end
