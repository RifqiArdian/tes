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

ActiveRecord::Schema.define(version: 20150701012143) do

  create_table "distributors", force: :cascade do |t|
    t.integer  "distributor_id"
    t.string   "distributor_name"
    t.string   "address"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "fax"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "email"
    t.string   "fullname"
    t.string   "address"
    t.string   "nirthdate"
    t.string   "joindate"
    t.string   "phone"
    t.string   "mobile"
    t.string   "distributor_id"
    t.string   "warehouse_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.text     "salt"
    t.text     "encrypted_password"
    t.string   "password"
    t.boolean  "status"
    t.string   "role"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "warehouses", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.string   "warehouse_name"
    t.string   "address"
    t.string   "phone"
    t.string   "code"
    t.string   "distributor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
