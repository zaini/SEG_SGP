# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_09_001115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "account_name"
    t.string "account_number"
    t.string "sort_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "interest_rate"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code"
    t.decimal "rate_to_gbp"
    t.belongs_to :user
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "symbol"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "bank_account_id"
    t.text "date"
    t.text "description"
    t.string "reference"
    t.decimal "money_in"
    t.decimal "money_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_account_id"], name: "index_transactions_on_bank_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "admin_id"
    t.integer "currency_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_logged_in"
    t.index ["admin_id"], name: "index_users_on_admin_id"
  end

  add_foreign_key "transactions", "bank_accounts"
end
