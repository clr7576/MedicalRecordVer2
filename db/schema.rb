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

ActiveRecord::Schema[7.0].define(version: 2022_12_19_155655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "discharge", default: "hospitalization"
    t.index ["deleted_at"], name: "index_animals_on_deleted_at"
    t.index ["discharge"], name: "index_animals_on_discharge"
  end

  create_table "basal_values", force: :cascade do |t|
    t.string "HR"
    t.string "RR"
    t.string "BP"
    t.string "BT"
    t.datetime "time"
    t.datetime "deleted_at"
    t.text "description"
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_basal_values_on_animal_id"
    t.index ["deleted_at"], name: "index_basal_values_on_deleted_at"
  end

  add_foreign_key "basal_values", "animals"
end
