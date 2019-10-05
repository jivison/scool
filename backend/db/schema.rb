# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_05_171338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.boolean "present"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_role_id", null: false
    t.bigint "course_block_id", null: false
    t.index ["course_block_id"], name: "index_attendances_on_course_block_id"
    t.index ["course_role_id"], name: "index_attendances_on_course_role_id"
  end

  create_table "course_assignments", force: :cascade do |t|
    t.date "assign_date"
    t.date "due_date"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "assignment_id", null: false
    t.bigint "course_id", null: false
    t.index ["assignment_id"], name: "index_course_assignments_on_assignment_id"
    t.index ["course_id"], name: "index_course_assignments_on_course_id"
  end

  create_table "course_blocks", force: :cascade do |t|
    t.date "date"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_id", null: false
    t.bigint "course_role_id", null: false
    t.index ["course_id"], name: "index_course_blocks_on_course_id"
    t.index ["course_role_id"], name: "index_course_blocks_on_course_role_id"
  end

  create_table "course_roles", force: :cascade do |t|
    t.string "type"
    t.boolean "is_archived"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_course_roles_on_course_id"
    t.index ["user_id"], name: "index_course_roles_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.string "type"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendances", "course_blocks"
  add_foreign_key "attendances", "course_roles"
  add_foreign_key "course_assignments", "assignments"
  add_foreign_key "course_assignments", "courses"
  add_foreign_key "course_blocks", "course_roles"
  add_foreign_key "course_blocks", "courses"
  add_foreign_key "course_roles", "courses"
  add_foreign_key "course_roles", "users"
end
