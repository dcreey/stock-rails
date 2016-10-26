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

ActiveRecord::Schema.define(version: 20161023164719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.text    "symbol"
    t.text    "name"
    t.decimal "market_cap",    precision: 20, scale: 2
    t.decimal "last_sale",     precision: 12, scale: 5
    t.text    "adr_tso"
    t.integer "ipo_year"
    t.text    "sector"
    t.text    "industry"
    t.text    "summary_quote"
    t.integer "exchange_id"
    t.index ["exchange_id"], name: "index_companies_on_exchange_id", using: :btree
  end

  create_table "exchanges", force: :cascade do |t|
    t.text    "name"
    t.integer "company_id"
    t.index ["company_id"], name: "index_exchanges_on_company_id", using: :btree
  end

  add_foreign_key "companies", "exchanges"
end
