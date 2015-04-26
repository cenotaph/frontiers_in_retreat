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

ActiveRecord::Schema.define(version: 20150426135948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "firstname",  limit: 255
    t.string   "surname",    limit: 255
    t.text     "bio"
    t.string   "website",    limit: 255
    t.string   "slug",       limit: 255
    t.boolean  "visible"
    t.string   "sortname",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "site_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "name",               limit: 255
    t.string   "image",              limit: 255
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_content_type", limit: 255
    t.string   "facebook_link",      limit: 255
    t.text     "description"
    t.string   "external_link",      limit: 255
    t.boolean  "published"
    t.string   "slug",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "events", ["site_id"], name: "index_events_on_site_id", using: :btree

  create_table "events_residencies", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "residency_id"
  end

  add_index "events_residencies", ["event_id", "residency_id"], name: "index_events_residencies_on_event_id_and_residency_id", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.text     "content"
    t.datetime "timestamp"
    t.boolean  "hidden"
    t.string   "link_url"
    t.string   "source"
    t.string   "title"
    t.integer  "twitter_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["item_type", "item_id"], name: "index_feeds_on_item_type_and_item_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image",              limit: 255
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_content_type", limit: 255
    t.string   "caption",            limit: 255
    t.string   "credit",             limit: 255
    t.integer  "item_id"
    t.string   "item_type",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["item_type", "item_id"], name: "index_images_on_item_type_and_item_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body"
    t.boolean  "published"
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body"
    t.string   "slug",         limit: 255
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "slug",        limit: 255
    t.string   "weblink",     limit: 255
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_residencies", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "residency_id"
  end

  create_table "residencies", force: :cascade do |t|
    t.integer  "artist_id",               null: false
    t.integer  "site_id",                 null: false
    t.date     "start_at"
    t.date     "end_at"
    t.text     "description"
    t.string   "slug",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "residencies", ["artist_id"], name: "index_residencies_on_artist_id", using: :btree
  add_index "residencies", ["site_id"], name: "index_residencies_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "city",               limit: 255
    t.string   "country",            limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",            limit: 255
    t.boolean  "lead"
    t.string   "slug",               limit: 255
    t.string   "image",              limit: 255
    t.integer  "image_size"
    t.string   "image_content_type", limit: 255
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "website",            limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.integer  "site_id"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
