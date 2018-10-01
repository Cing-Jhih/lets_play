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

ActiveRecord::Schema.define(version: 20181001155608) do

  create_table "age_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "age_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ages", force: :cascade do |t|
    t.float "old"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "tool"
    t.text "step"
    t.string "url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorites_count", default: 0
    t.integer "replies_count", default: 0
    t.integer "min_age"
    t.integer "max_age"
  end

  create_table "games_tags", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "tag_id"
    t.index ["game_id"], name: "index_games_tags_on_game_id"
    t.index ["tag_id"], name: "index_games_tags_on_tag_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situation_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "situation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", force: :cascade do |t|
    t.text "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.date "kid_birth"
    t.text "intro"
    t.string "avatar"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fb_uid"
    t.string "fb_token"
    t.integer "favorites_count", default: 0
    t.integer "games_count", default: 0
    t.integer "replies_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
