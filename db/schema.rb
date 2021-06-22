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

ActiveRecord::Schema.define(version: 2021_06_20_040407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_offices", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "id_category_father"
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "document_number"
    t.integer "gender"
    t.datetime "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "phone_number"
    t.bigint "branch_office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_office_id"], name: "index_phone_numbers_on_branch_office_id"
  end

  create_table "price_registers", force: :cascade do |t|
    t.float "price"
    t.datetime "begin_at"
    t.datetime "ends_at"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_price_registers_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.float "purchase_amount"
    t.float "sale_amount"
    t.integer "stock"
    t.bigint "branch_office_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_office_id"], name: "index_products_on_branch_office_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "rotations", force: :cascade do |t|
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.boolean "head"
    t.bigint "branch_office_id", null: false
    t.bigint "department_id", null: false
    t.bigint "stall_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_office_id"], name: "index_rotations_on_branch_office_id"
    t.index ["department_id"], name: "index_rotations_on_department_id"
    t.index ["employee_id"], name: "index_rotations_on_employee_id"
    t.index ["stall_id"], name: "index_rotations_on_stall_id"
  end

  create_table "sales", force: :cascade do |t|
    t.float "discount"
    t.float "total_amount"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "stalls", force: :cascade do |t|
    t.string "stall_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.boolean "admin", null: false
    t.integer "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "phone_numbers", "branch_offices"
  add_foreign_key "price_registers", "products"
  add_foreign_key "products", "branch_offices"
  add_foreign_key "products", "categories"
  add_foreign_key "rotations", "branch_offices"
  add_foreign_key "rotations", "departments"
  add_foreign_key "rotations", "employees"
  add_foreign_key "rotations", "stalls"
  add_foreign_key "sales", "products"
end
