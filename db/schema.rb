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

ActiveRecord::Schema.define(version: 20170726202904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workplace_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
    t.index ["workplace_id"], name: "index_favourites_on_workplace_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wifi"
    t.integer  "noise"
    t.integer  "comfort"
    t.integer  "service"
    t.index ["review_id"], name: "index_ratings_on_review_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "workplace_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
    t.index ["workplace_id"], name: "index_reviews_on_workplace_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.text     "bio"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.boolean  "checkin"
    t.integer  "user_id"
    t.integer  "workplace_id"
    t.datetime "checkintime"
    t.datetime "checkouttime"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_visits_on_user_id", using: :btree
    t.index ["workplace_id"], name: "index_visits_on_workplace_id", using: :btree
  end

  create_table "workplacefeatures", force: :cascade do |t|
    t.integer  "feature_id"
    t.integer  "workplace_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["feature_id"], name: "index_workplacefeatures_on_feature_id", using: :btree
    t.index ["workplace_id"], name: "index_workplacefeatures_on_workplace_id", using: :btree
  end

  create_table "workplacephotos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workplace_id"
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_workplacephotos_on_user_id", using: :btree
    t.index ["workplace_id"], name: "index_workplacephotos_on_workplace_id", using: :btree
  end

  create_table "workplaces", force: :cascade do |t|
    t.integer  "category"
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "google_id"
    t.string   "photo"
    t.float    "global_rating"
    t.string   "phone_number"
  end

  add_foreign_key "favourites", "users"
  add_foreign_key "favourites", "workplaces"
  add_foreign_key "ratings", "reviews"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "workplaces"
  add_foreign_key "visits", "users"
  add_foreign_key "visits", "workplaces"
  add_foreign_key "workplacefeatures", "features"
  add_foreign_key "workplacefeatures", "workplaces"
  add_foreign_key "workplacephotos", "users"
  add_foreign_key "workplacephotos", "workplaces"
end
