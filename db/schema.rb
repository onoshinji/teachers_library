
ActiveRecord::Schema.define(version: 2020_08_05_032318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "posts_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_favorites_on_posts_id"
    t.index ["users_id"], name: "index_favorites_on_users_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "title", null: false
    t.text "content"
    t.text "image"
    t.integer "grade"
    t.integer "subject"
    t.text "unit"
    t.integer "views_count"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_posts_on_users_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tags_id", null: false
    t.bigint "posts_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_taggings_on_posts_id"
    t.index ["tags_id"], name: "index_taggings_on_tags_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "image"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "taggings", "posts", column: "posts_id"
  add_foreign_key "taggings", "tags", column: "tags_id"
end
