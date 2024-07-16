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

ActiveRecord::Schema[7.1].define(version: 2024_07_16_200658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "field_templates", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.bigint "tenant_id", null: false
    t.string "select_options", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id", "name"], name: "index_field_templates_on_tenant_id_and_name", unique: true
    t.index ["tenant_id"], name: "index_field_templates_on_tenant_id"
  end

  create_table "field_values", force: :cascade do |t|
    t.bigint "field_template_id", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "customable_type"
    t.bigint "customable_id"
    t.index ["customable_type", "customable_id"], name: "index_field_values_on_customable"
    t.index ["field_template_id"], name: "index_field_values_on_field_template_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id", "name"], name: "index_users_on_tenant_id_and_name", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "field_templates", "tenants"
  add_foreign_key "field_values", "field_templates"
  add_foreign_key "users", "tenants"
end
