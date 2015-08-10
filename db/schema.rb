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

ActiveRecord::Schema.define(version: 20150809195226) do

  create_table "battles", force: :cascade do |t|
    t.integer  "attacker_id"
    t.integer  "attacker_rank"
    t.integer  "defender_id"
    t.integer  "defender_rank"
    t.integer  "destruction_percent"
    t.integer  "minutes_left_in_war"
    t.integer  "stars_awarded"
    t.integer  "war_stars_awarded"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "war_id"
  end

  add_index "battles", ["attacker_id"], name: "index_battles_on_attacker_id"
  add_index "battles", ["defender_id"], name: "index_battles_on_defender_id"
  add_index "battles", ["war_id"], name: "index_battles_on_war_id"

  create_table "clan_players", force: :cascade do |t|
    t.integer  "clan_id"
    t.integer  "player_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clan_players", ["clan_id", "player_id"], name: "index_clan_players_on_clan_id_and_player_id", unique: true

  create_table "clan_wars", force: :cascade do |t|
    t.integer  "clan_id"
    t.integer  "war_id"
    t.boolean  "winner"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "player_count"
    t.integer  "war_stars_awarded"
  end

  add_index "clan_wars", ["clan_id", "war_id"], name: "index_clan_wars_on_clan_id_and_war_id", unique: true

  create_table "clans", force: :cascade do |t|
    t.string   "coc_id"
    t.string   "clan_type",         default: "Anyone can join"
    t.integer  "level",             default: 1
    t.string   "name"
    t.integer  "required_trophies", default: 0
    t.string   "war_frequency"
    t.integer  "wars_won",          default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "level"
    t.string   "name"
    t.string   "coc_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "attacks_won",                     default: 0
    t.integer  "attacks_won_with_war_stars",      default: 0
    t.integer  "defences_won_completely",         default: 0
    t.integer  "defences_won_war_stars_defended", default: 0
    t.integer  "stars",                           default: 0
    t.integer  "stars_lost",                      default: 0
    t.integer  "war_stars",                       default: 0
    t.integer  "war_stars_lost",                  default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wars", force: :cascade do |t|
    t.date     "war_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
