# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_08_225942) do

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "model"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "date"
    t.float "sub_total"
    t.float "tax"
    t.float "total"
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_invoices_on_order_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "stage_name"
    t.integer "estimate_time"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.text "issue_description"
    t.string "photo_in"
    t.string "photo_out"
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_operations_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date_in"
    t.date "date_out"
    t.date "date_real"
    t.text "issue_description"
    t.string "photo"
    t.integer "user_id", null: false
    t.integer "device_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_orders_on_device_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "amount"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.integer "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_stages_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "dni"
    t.string "address"
    t.boolean "status"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devices", "users"
  add_foreign_key "invoices", "orders"
  add_foreign_key "operations", "orders"
  add_foreign_key "orders", "devices"
  add_foreign_key "orders", "services"
  add_foreign_key "orders", "users"
  add_foreign_key "stages", "services"
end
