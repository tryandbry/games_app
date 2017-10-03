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

ActiveRecord::Schema.define(version: 20171003194645) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scorehome"
    t.integer  "scoreaway"
  end

  create_table "homegames", force: :cascade do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.boolean "home"
  end

  add_index "homegames", ["game_id"], name: "index_homegames_on_game_id"
  add_index "homegames", ["team_id"], name: "index_homegames_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

end
