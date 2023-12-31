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

ActiveRecord::Schema[7.0].define(version: 2023_11_25_070720) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.float "unit_price"
    t.float "sales_price"
    t.integer "min_sales_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.json "details"
    t.float "price"
    t.float "savings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
