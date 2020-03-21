ActiveRecord::Schema.define(version: 2020_03_21_143029) do


  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "upload"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pictures", "users"
end
