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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 201307250843508) do

  create_table "category", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comment", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment", ["post_id"], :name => "index_hobo_comment_on_post_id"
  add_index "comment", ["user_id"], :name => "index_hobo_comment_on_user_id"

  create_table "kindeditor_assets", :force => true do |t|
    t.string   "asset"
    t.integer  "file_size"
    t.string   "file_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "post", ["category_id"], :name => "index_hobo_post_on_category_id"
  add_index "post", ["user_id"], :name => "index_hobo_post_on_user_id"

  create_table "tag", :force => true do |t|
    t.integer  "post_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag", ["post_id"], :name => "index_hobo_tag_on_post_id"

  create_table "user", :force => true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
