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

ActiveRecord::Schema.define(version: 20131117225756) do

  create_table "addresses_bkp", force: true do |t|
    t.string   "address1",                     null: false
    t.string   "address2"
    t.string   "city",                         null: false
    t.string   "state",                        null: false
    t.string   "country",      default: "USA", null: false
    t.integer  "zip",                          null: false
    t.string   "address_type"
    t.uuid     "uuid"
    t.string   "company_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "addresses_bkp", ["updated_at"], name: "index_addresses_on_updated_at", using: :btree
  add_index "addresses_bkp", ["uuid"], name: "index_addresses_on_uuid", using: :btree

  create_table "credit_cards", force: true do |t|
    t.string  "card_holder",      null: false
    t.string  "card_number",      null: false
    t.integer "expiration_month", null: false
    t.integer "expiration_year",  null: false
    t.integer "card_cvv",         null: false
    t.uuid    "uuid"
    t.integer "order_id"
  end

  create_table "customers", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "security_phrase"
    t.integer  "affiliate_id"
    t.uuid     "uuid"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dids_bkp", force: true do |t|
    t.string   "area_code",    limit: 3
    t.string   "prefix",       limit: 3
    t.string   "suffix",       limit: 4
    t.string   "city",         limit: 45
    t.string   "state",        limit: 2
    t.string   "status",       limit: 9,  default: "available"
    t.integer  "toll_free",               default: 0
    t.integer  "line_item_id", limit: 8
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dids_bkp", ["area_code", "prefix", "suffix"], name: "area_code", using: :btree

  create_table "equipments", force: true do |t|
    t.integer  "sort_id"
    t.integer  "netx_id"
    t.string   "name"
    t.string   "description", limit: 1024
    t.string   "model"
    t.string   "device_type"
    t.string   "price"
    t.string   "list_price"
    t.string   "img_url"
    t.string   "default_row"
    t.string   "available"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.string   "number"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "product_id"
    t.string   "service_price"
    t.integer  "equipment_id"
    t.string   "equipment_price"
    t.integer  "address_id"
    t.string   "total_price_per_seat"
    t.integer  "order_id"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["address_id"], name: "index_line_items_on_address_id", using: :btree
  add_index "line_items", ["equipment_id"], name: "index_line_items_on_equipment_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree
  add_index "line_items", ["updated_at"], name: "index_line_items_on_updated_at", using: :btree
  add_index "line_items", ["uuid"], name: "index_line_items_on_uuid", using: :btree

  create_table "orders", force: true do |t|
    t.string   "order_number"
    t.string   "tax_price"
    t.string   "shipping_price"
    t.string   "gross_price"
    t.string   "promotion_id"
    t.string   "net_price"
    t.string   "address_id"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "primary_address_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "payment_address_id"
    t.integer  "credit_cards"
    t.integer  "customer_id"
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["promotion_id"], name: "index_orders_on_promotion_id", using: :btree
  add_index "orders", ["updated_at"], name: "index_orders_on_updated_at", using: :btree
  add_index "orders", ["uuid"], name: "index_orders_on_uuid", using: :btree

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "partner_id"
    t.integer  "netx_id"
    t.string   "product_type"
    t.string   "description",              limit: 1024
    t.decimal  "price",                                 precision: 10, scale: 2
    t.string   "list_price"
    t.string   "category"
    t.string   "default_row"
    t.string   "add_on"
    t.string   "did_reqd"
    t.string   "device_reqd"
    t.string   "device_optional"
    t.integer  "recommended_equipment_id"
    t.string   "available"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order",                                                  default: 0
    t.string   "product_abbreviation"
    t.boolean  "is_user_product",                                                default: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
