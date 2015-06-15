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

ActiveRecord::Schema.define(version: 20150615064203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "points"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "verified",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "question_id"
    t.integer  "comment_id"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "owner_id"
    t.string   "description"
    t.string   "uid"
    t.boolean  "public",      default: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  add_index "courses_users", ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id", using: :btree
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id", using: :btree

  create_table "file_attachments", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "question_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "solved",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "uid"
    t.string   "category"
    t.boolean  "anonymous",  default: false
    t.integer  "lecture_id"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "comments"
end
