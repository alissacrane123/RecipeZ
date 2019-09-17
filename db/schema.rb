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

ActiveRecord::Schema.define(version: 2019_09_17_163429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.text "items", default: [], null: false, array: true
    t.string "main", null: false
    t.boolean "df", default: false
    t.boolean "gf", default: false
    t.boolean "nf", default: false
    t.boolean "vegan", default: false
    t.boolean "veget", default: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["df"], name: "index_ingredients_on_df"
    t.index ["gf"], name: "index_ingredients_on_gf"
    t.index ["main"], name: "index_ingredients_on_main"
    t.index ["nf"], name: "index_ingredients_on_nf"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
    t.index ["vegan"], name: "index_ingredients_on_vegan"
    t.index ["veget"], name: "index_ingredients_on_veget"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "url_id", null: false
    t.text "directions", default: [], array: true
    t.string "img_src", null: false
    t.text "keywords", default: [], array: true
    t.string "main", null: false
    t.integer "rating"
    t.integer "num_ingred", null: false
    t.integer "num_dir", null: false
    t.integer "time"
    t.integer "cal"
    t.index ["cal"], name: "index_recipes_on_cal"
    t.index ["main"], name: "index_recipes_on_main"
    t.index ["num_dir"], name: "index_recipes_on_num_dir"
    t.index ["num_ingred"], name: "index_recipes_on_num_ingred"
    t.index ["time"], name: "index_recipes_on_time"
  end

  create_table "urls", force: :cascade do |t|
    t.string "url", null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_urls_on_url"
  end

end
