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

ActiveRecord::Schema[7.1].define(version: 2024_06_27_035341) do
  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "capital"
    t.string "region"
    t.string "subregion"
    t.integer "population"
    t.float "area"
    t.string "flag_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_languages", force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_languages_on_country_id"
    t.index ["language_id"], name: "index_country_languages_on_language_id"
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dish"
    t.index ["country_id"], name: "index_cuisines_on_country_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "country_languages", "countries"
  add_foreign_key "country_languages", "languages"
  add_foreign_key "cuisines", "countries"
end
