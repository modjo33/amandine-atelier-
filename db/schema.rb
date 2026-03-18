# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_18_164304) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "category"
    t.text "content"
    t.datetime "created_at", null: false
    t.text "excerpt"
    t.string "meta_description"
    t.integer "position"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_articles_on_category"
    t.index ["published"], name: "index_articles_on_published"
    t.index ["published_at"], name: "index_articles_on_published_at"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.text "message"
    t.boolean "newsletter_opt_in", default: false
    t.string "phone"
    t.string "unsubscribe_token"
    t.datetime "updated_at", null: false
    t.index ["unsubscribe_token"], name: "index_contacts_on_unsubscribe_token", unique: true
  end

  create_table "page_views", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.string "path"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.index ["created_at"], name: "index_page_views_on_created_at"
    t.index ["path"], name: "index_page_views_on_path"
  end

  create_table "posts", force: :cascade do |t|
    t.boolean "active"
    t.text "caption"
    t.datetime "created_at", null: false
    t.string "image"
    t.string "instagram_url"
    t.integer "position"
    t.string "post_type"
    t.datetime "published_at"
    t.datetime "updated_at", null: false
  end

  create_table "site_contents", force: :cascade do |t|
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "key"
    t.integer "position"
    t.string "section"
    t.datetime "updated_at", null: false
    t.text "value"
    t.index ["key"], name: "index_site_contents_on_key", unique: true
  end

  create_table "subscribers", force: :cascade do |t|
    t.boolean "confirmed"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "source"
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.text "quote"
    t.string "role"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
