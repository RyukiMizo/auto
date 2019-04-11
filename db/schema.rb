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

ActiveRecord::Schema.define(version: 20190411230423) do

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "profile_url"
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "profile_url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "hashtag_comments", force: :cascade do |t|
    t.string "content"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_hashtag_comments_on_comment_id"
  end

  create_table "hashtag_follows", force: :cascade do |t|
    t.string "content"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_hashtag_follows_on_follow_id"
  end

  create_table "hashtag_likes", force: :cascade do |t|
    t.string "content"
    t.integer "like_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["like_id"], name: "index_hashtag_likes_on_like_id"
  end

  create_table "hashtag_messages", force: :cascade do |t|
    t.string "content"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_hashtag_messages_on_message_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "profile_url"
    t.integer "user_id"
    t.integer "maximum", default: 20
    t.integer "minimum", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "profile_url"
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "unfollows", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "profile_url"
    t.integer "user_id"
    t.datetime "unfollow_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_unfollows_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "image"
    t.string "url"
    t.integer "follower_number"
    t.integer "follow_number"
    t.integer "like_number"
    t.boolean "connection", default: false, null: false
    t.boolean "follow_connection", default: false, null: false
    t.boolean "unfollow_connection", default: false, null: false
    t.boolean "like_connection", default: false, null: false
    t.boolean "comment_connection", default: false, null: false
    t.boolean "message_connection", default: false, null: false
    t.datetime "follow_time"
    t.datetime "like_time"
    t.datetime "comment_timer"
    t.datetime "message_time"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
