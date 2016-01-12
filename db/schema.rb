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

ActiveRecord::Schema.define(version: 20160112065626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coop_suppliers", force: :cascade do |t|
    t.integer  "coop_id"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coop_suppliers", ["coop_id"], name: "index_coop_suppliers_on_coop_id", using: :btree
  add_index "coop_suppliers", ["supplier_id"], name: "index_coop_suppliers_on_supplier_id", using: :btree

  create_table "coops", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finalisings", force: :cascade do |t|
    t.date     "final_date"
    t.integer  "coop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "finalisings", ["coop_id"], name: "index_finalisings_on_coop_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "number"
    t.date     "join_date"
    t.string   "contact_number"
    t.string   "email",                  default: "---\n:null: false\n:default: ''\n"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.string   "encrypted_password",     default: "",                                  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "members_coops", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "coop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members_coops", ["coop_id"], name: "index_members_coops_on_coop_id", using: :btree
  add_index "members_coops", ["member_id"], name: "index_members_coops_on_member_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "qty"
    t.date     "order_date"
    t.integer  "product_id"
    t.integer  "member_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["member_id"], name: "index_orders_on_member_id", using: :btree
  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree

  create_table "price_lists", force: :cascade do |t|
    t.date     "EffectiveDate"
    t.integer  "supplier_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "price_lists", ["supplier_id"], name: "index_price_lists_on_supplier_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.decimal  "price_per_unit"
    t.integer  "price_list_id"
    t.integer  "product_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "prices", ["price_list_id"], name: "index_prices_on_price_list_id", using: :btree
  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "product_code"
    t.string   "description"
    t.string   "unit"
    t.decimal  "qty_outer"
    t.decimal  "qty_min"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "finalising_id"
  end

  add_index "products", ["finalising_id"], name: "index_products_on_finalising_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coop_suppliers", "coops"
  add_foreign_key "coop_suppliers", "suppliers"
  add_foreign_key "finalisings", "coops"
  add_foreign_key "members_coops", "coops"
  add_foreign_key "members_coops", "members"
  add_foreign_key "orders", "members"
  add_foreign_key "orders", "products"
  add_foreign_key "price_lists", "suppliers"
  add_foreign_key "prices", "price_lists"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "finalisings"
end
