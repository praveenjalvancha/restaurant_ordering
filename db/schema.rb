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

ActiveRecord::Schema.define(version: 20170318203629) do

  create_table "dine_tables", force: :cascade do |t|
    t.string   "table_number"
    t.string   "status",       default: "Available"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "capacity",     default: 4
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "item_image_file_name"
    t.string   "item_image_content_type"
    t.integer  "item_image_file_size"
    t.datetime "item_image_updated_at"
    t.boolean  "available",               default: true
    t.string   "category"
    t.float    "price"
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_state"
    t.integer  "dine_table_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category"
    t.integer  "waiter_id"
    t.integer  "total_price"
    t.index ["dine_table_id"], name: "index_orders_on_dine_table_id"
  end

  create_table "table_current_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "dine_table_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waiters", force: :cascade do |t|
    t.string   "name"
    t.string   "e_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
