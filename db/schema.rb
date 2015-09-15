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

ActiveRecord::Schema.define(version: 20150915190025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "invoice_id"
    t.string  "quantity"
    t.string  "unit_price"
    t.string  "created_at"
    t.string  "updated_at"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "merchant_id"
    t.string  "status"
    t.string  "created_at"
    t.string  "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "unit_price"
    t.integer "merchant_id"
    t.string  "created_at"
    t.string  "updated_at"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "invoice_id"
    t.string  "credit_card_number"
    t.string  "credit_card_expiration_date"
    t.string  "result"
    t.string  "created_at"
    t.string  "updated_at"
  end

end
