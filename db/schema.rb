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

ActiveRecord::Schema.define(version: 2022_04_13_204617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.bigint "employee_id"
    t.float "gross_salary"
    t.integer "payroll_type"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_contracts_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rfc"
    t.date "date_registered"
    t.string "imss_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidences", force: :cascade do |t|
    t.bigint "employee_id"
    t.integer "incidence_type"
    t.integer "concept"
    t.date "start_date"
    t.date "end_date"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_incidences_on_employee_id"
  end

  create_table "payroll_invoices", force: :cascade do |t|
    t.bigint "employee_id"
    t.date "start_date"
    t.date "end_date"
    t.text "concept"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payroll_invoices_on_employee_id"
  end

  add_foreign_key "contracts", "employees"
  add_foreign_key "incidences", "employees"
  add_foreign_key "payroll_invoices", "employees"
end
