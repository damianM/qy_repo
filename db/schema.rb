# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100929215230) do

  create_table "comments", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "efiles", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "event_start"
    t.date     "event_end"
    t.string   "place"
    t.string   "organiser_name"
    t.string   "organiser_address"
    t.string   "organiser_www"
    t.string   "category"
    t.string   "organiser_email"
    t.string   "organiser_phone"
    t.text     "relation"
    t.date     "relationdate"
  end

  create_table "forums", :force => true do |t|
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fposts", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumb"
    t.integer  "event_id"
  end

  create_table "message_details", :force => true do |t|
    t.integer  "message_id"
    t.integer  "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "read"
  end

  create_table "pcomments", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "link"
    t.string   "thumb"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "counter"
  end

  create_table "prates", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "sum"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quads", :force => true do |t|
    t.string   "qtype"
    t.text     "description"
    t.integer  "gallery_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "initiator_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true

  create_table "teamusers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userprates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "prate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.string   "crypted_password",                                  :null => false
    t.string   "persistence_token",                                 :null => false
    t.string   "perishable_token",                                  :null => false
    t.boolean  "active",                         :default => false
    t.string   "password_salt"
    t.string   "name"
    t.string   "surname"
    t.string   "skype"
    t.string   "gg"
    t.string   "city"
    t.date     "birth"
    t.text     "about"
    t.string   "sex",               :limit => 1
    t.integer  "state_id"
  end

  create_table "uservrates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vrate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vcomments", :force => true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "link"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views"
    t.integer  "counter"
  end

  create_table "vrates", :force => true do |t|
    t.integer  "video_id"
    t.integer  "sum"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
