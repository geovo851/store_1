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

ActiveRecord::Schema.define(version: 20150812074235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.integer  "payment_id"
    t.text     "delivary_adress"
    t.boolean  "order"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "type_of_paiment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.string   "photo"
    t.text     "description"
    t.integer  "category_id"
    t.float    "price"
    t.boolean  "available"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "products_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.float    "quantity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products_orders", ["order_id"], name: "index_products_orders_on_order_id", using: :btree
  add_index "products_orders", ["product_id"], name: "index_products_orders_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "adress"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products_orders", "orders"
  add_foreign_key "products_orders", "products"
end
