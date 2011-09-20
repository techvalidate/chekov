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

ActiveRecord::Schema.define(:version => 20110920230311) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "context_id"
    t.boolean  "ie6",        :default => false
    t.boolean  "ie8",        :default => false
    t.boolean  "ie9",        :default => false
    t.boolean  "ff",         :default => false
    t.boolean  "chrome",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["context_id"], :name => "index_assignments_on_context_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "checks", :force => true do |t|
    t.integer  "suite_id"
    t.integer  "element_id"
    t.boolean  "passed",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checks", ["element_id"], :name => "index_checks_on_element_id"
  add_index "checks", ["suite_id"], :name => "index_checks_on_suite_id"

  create_table "contexts", :force => true do |t|
    t.integer  "release_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ie6",         :default => true
    t.boolean  "ie8",         :default => true
    t.boolean  "ie9",         :default => true
    t.boolean  "ff",          :default => true
    t.boolean  "chrome",      :default => true
    t.text     "description"
  end

  add_index "contexts", ["chrome"], :name => "index_contexts_on_chrome"
  add_index "contexts", ["ff"], :name => "index_contexts_on_ff"
  add_index "contexts", ["ie6"], :name => "index_contexts_on_ie6"
  add_index "contexts", ["ie8"], :name => "index_contexts_on_ie8"
  add_index "contexts", ["ie9"], :name => "index_contexts_on_ie9"
  add_index "contexts", ["release_id"], :name => "index_contexts_on_release_id"

  create_table "elements", :force => true do |t|
    t.integer  "story_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elements", ["story_id"], :name => "index_elements_on_story_id"

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.boolean  "current",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.integer  "context_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "stories", ["context_id"], :name => "index_stories_on_context_id"

  create_table "suites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ie6",        :default => false
    t.boolean  "ie8",        :default => false
    t.boolean  "ie9",        :default => false
    t.boolean  "ff",         :default => false
    t.boolean  "chrome",     :default => false
  end

  add_index "suites", ["chrome"], :name => "index_suites_on_chrome"
  add_index "suites", ["ff"], :name => "index_suites_on_ff"
  add_index "suites", ["ie6"], :name => "index_suites_on_ie6"
  add_index "suites", ["ie8"], :name => "index_suites_on_ie8"
  add_index "suites", ["ie9"], :name => "index_suites_on_ie9"
  add_index "suites", ["story_id"], :name => "index_suites_on_story_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
