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

ActiveRecord::Schema.define(version: 20150526195516) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "context_id"
    t.boolean  "ie8",        default: false
    t.boolean  "ie9",        default: false
    t.boolean  "ff",         default: false
    t.boolean  "chrome",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ie10",       default: false
    t.boolean  "ios",        default: false
    t.boolean  "android",    default: false
    t.boolean  "safari",     default: false
    t.boolean  "ie11",       default: false
  end

  add_index "assignments", ["context_id"], name: "index_assignments_on_context_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "checks", force: :cascade do |t|
    t.integer  "suite_id"
    t.integer  "element_id"
    t.boolean  "passed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checks", ["element_id"], name: "index_checks_on_element_id"
  add_index "checks", ["suite_id"], name: "index_checks_on_suite_id"

  create_table "contexts", force: :cascade do |t|
    t.integer  "release_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ie8",         default: true
    t.boolean  "ie9",         default: true
    t.boolean  "ff",          default: true
    t.boolean  "chrome",      default: true
    t.text     "description"
    t.boolean  "ie10",        default: false
    t.boolean  "ios",         default: false
    t.boolean  "android",     default: false
    t.boolean  "safari",      default: false
    t.boolean  "ie11",        default: false
  end

  add_index "contexts", ["android"], name: "index_contexts_on_android"
  add_index "contexts", ["chrome"], name: "index_contexts_on_chrome"
  add_index "contexts", ["ff"], name: "index_contexts_on_ff"
  add_index "contexts", ["ie10"], name: "index_contexts_on_ie10"
  add_index "contexts", ["ie11"], name: "index_contexts_on_ie11"
  add_index "contexts", ["ie8"], name: "index_contexts_on_ie8"
  add_index "contexts", ["ie9"], name: "index_contexts_on_ie9"
  add_index "contexts", ["ios"], name: "index_contexts_on_ios"
  add_index "contexts", ["release_id"], name: "index_contexts_on_release_id"
  add_index "contexts", ["safari"], name: "index_contexts_on_safari"

  create_table "elements", force: :cascade do |t|
    t.integer  "story_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    default: 0
  end

  add_index "elements", ["position"], name: "index_elements_on_position"
  add_index "elements", ["story_id"], name: "index_elements_on_story_id"

  create_table "releases", force: :cascade do |t|
    t.string   "name"
    t.boolean  "current",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: :cascade do |t|
    t.integer  "context_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "stories", ["context_id"], name: "index_stories_on_context_id"

  create_table "suites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ie8",        default: false
    t.boolean  "ie9",        default: false
    t.boolean  "ff",         default: false
    t.boolean  "chrome",     default: false
    t.boolean  "ie10",       default: false
    t.boolean  "ios",        default: false
    t.boolean  "android",    default: false
    t.boolean  "safari",     default: false
    t.boolean  "ie11",       default: false
  end

  add_index "suites", ["android"], name: "index_suites_on_android"
  add_index "suites", ["chrome"], name: "index_suites_on_chrome"
  add_index "suites", ["ff"], name: "index_suites_on_ff"
  add_index "suites", ["ie10"], name: "index_suites_on_ie10"
  add_index "suites", ["ie11"], name: "index_suites_on_ie11"
  add_index "suites", ["ie8"], name: "index_suites_on_ie8"
  add_index "suites", ["ie9"], name: "index_suites_on_ie9"
  add_index "suites", ["ios"], name: "index_suites_on_ios"
  add_index "suites", ["safari"], name: "index_suites_on_safari"
  add_index "suites", ["story_id"], name: "index_suites_on_story_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  add_index "users", ["active"], name: "index_users_on_active"

end
