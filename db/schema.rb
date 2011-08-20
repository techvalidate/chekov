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

ActiveRecord::Schema.define(:version => 20110820070225) do

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
  end

  add_index "contexts", ["release_id"], :name => "index_contexts_on_release_id"

  create_table "elements", :force => true do |t|
    t.integer  "story_id"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elements", ["position"], :name => "index_elements_on_position"
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
  end

  add_index "stories", ["context_id"], :name => "index_stories_on_context_id"

  create_table "suites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suites", ["story_id"], :name => "index_suites_on_story_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
