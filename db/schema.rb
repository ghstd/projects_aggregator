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

ActiveRecord::Schema[7.1].define(version: 2024_09_26_173944) do
  create_table "pet_projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "images"
    t.text "languages"
    t.text "libraries"
    t.text "resources"
    t.string "github"
    t.string "hosting"
    t.integer "age"
    t.boolean "is_game"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age"], name: "index_pet_projects_on_age", unique: true
    t.index ["is_game"], name: "index_pet_projects_on_is_game"
  end

end
