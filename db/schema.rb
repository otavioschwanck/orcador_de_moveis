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

ActiveRecord::Schema.define(version: 20151010000633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_items", force: :cascade do |t|
    t.integer  "item_id"
    t.float    "qtd"
    t.boolean  "multiplicable"
    t.integer  "mobile_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "budget_items", ["item_id"], name: "index_budget_items_on_item_id", using: :btree
  add_index "budget_items", ["mobile_id"], name: "index_budget_items_on_mobile_id", using: :btree

  create_table "budgets", force: :cascade do |t|
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "budgets", ["client_id"], name: "index_budgets_on_client_id", using: :btree

  create_table "by_meters", force: :cascade do |t|
    t.float    "width"
    t.float    "height"
    t.float    "meter_price"
    t.integer  "qtd"
    t.boolean  "multiplicable"
    t.integer  "mobile_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "by_meters", ["mobile_id"], name: "index_by_meters_on_mobile_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "email"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "drawers", force: :cascade do |t|
    t.text     "description"
    t.float    "width"
    t.float    "height"
    t.float    "front_plate"
    t.float    "internal"
    t.float    "slide"
    t.integer  "qtd"
    t.integer  "mobile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "back_plate"
    t.float    "depth"
  end

  add_index "drawers", ["mobile_id"], name: "index_drawers_on_mobile_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "value"
    t.text     "description"
    t.text     "who_sell"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "mobiles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "budget_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "multiplier"
  end

  add_index "mobiles", ["budget_id"], name: "index_mobiles_on_budget_id", using: :btree

  create_table "plates", force: :cascade do |t|
    t.float    "width"
    t.float    "height"
    t.float    "plate_value"
    t.integer  "qtd"
    t.integer  "mobile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "plates", ["mobile_id"], name: "index_plates_on_mobile_id", using: :btree

  create_table "unregistred_items", force: :cascade do |t|
    t.string   "description"
    t.float    "value"
    t.float    "qtd"
    t.integer  "mobile_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "multiplicable"
  end

  add_index "unregistred_items", ["mobile_id"], name: "index_unregistred_items_on_mobile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "budget_items", "items"
  add_foreign_key "budget_items", "mobiles"
  add_foreign_key "budgets", "clients"
  add_foreign_key "by_meters", "mobiles"
  add_foreign_key "clients", "users"
  add_foreign_key "drawers", "mobiles"
  add_foreign_key "items", "users"
  add_foreign_key "mobiles", "budgets"
  add_foreign_key "plates", "mobiles"
  add_foreign_key "unregistred_items", "mobiles"
end
