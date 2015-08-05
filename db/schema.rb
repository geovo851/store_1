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

ActiveRecord::Schema.define(version: 20150805095611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_positions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "good_id"
    t.float    "quantity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cart_positions", ["cart_id"], name: "index_cart_positions_on_cart_id", using: :btree
  add_index "cart_positions", ["good_id"], name: "index_cart_positions_on_good_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["payment_id"], name: "index_carts_on_payment_id", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.text     "description"
    t.integer  "category_id"
    t.float    "price"
    t.boolean  "available"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_positions", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "good_id"
    t.float    "qauntity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_positions", ["good_id"], name: "index_order_positions_on_good_id", using: :btree
  add_index "order_positions", ["order_id"], name: "index_order_positions_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "delivery_adress"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "type_of_paiment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.string   "street"
    t.string   "flat_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "cart_positions", "carts"
  add_foreign_key "cart_positions", "goods"
  add_foreign_key "carts", "payments"
  add_foreign_key "carts", "users"
  add_foreign_key "order_positions", "goods"
  add_foreign_key "order_positions", "orders"
  add_foreign_key "orders", "users"
end
