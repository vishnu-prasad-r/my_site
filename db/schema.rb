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

ActiveRecord::Schema.define(:version => 20120916153016) do

  create_table "courts", :force => true do |t|
    t.string   "court"
    t.boolean  "lights"
    t.string   "name"
    t.string   "address"
    t.string   "home"
    t.string   "mobile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.datetime "date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "fixtures", :force => true do |t|
    t.integer  "court_id"
    t.date     "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "division_id"
    t.integer  "teamone_id"
    t.integer  "teamtwo_id"
  end

  create_table "players", :force => true do |t|
    t.integer  "Mailing_ListID"
    t.string   "Title"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "Address1"
    t.text     "Address2"
    t.text     "Address3"
    t.text     "Address4"
    t.text     "Address5"
    t.string   "Postal_Code"
    t.string   "Home_Phone"
    t.string   "Work_Phone"
    t.integer  "division_id"
    t.boolean  "pot_luck"
    t.string   "email"
    t.boolean  "Over_55s"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "results", :force => true do |t|
    t.integer  "fixture"
    t.integer  "set1team1"
    t.integer  "set1team2"
    t.integer  "set2team1"
    t.integer  "set2team2"
    t.integer  "set3team1"
    t.integer  "set3team2"
    t.integer  "team1"
    t.integer  "team2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "teams", :force => true do |t|
    t.integer  "playerone_id"
    t.integer  "playertwo_id"
    t.integer  "division_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
