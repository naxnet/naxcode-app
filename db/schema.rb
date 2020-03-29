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

ActiveRecord::Schema.define(version: 2020_03_29_062011) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignment_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "assignment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignment_files_on_assignment_id"
  end

  create_table "assignment_user_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "assignment_user_id", null: false
    t.bigint "assignment_file_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_file_id", "assignment_user_id"], name: "auf_af_id_au_id_index", unique: true
    t.index ["assignment_file_id"], name: "index_assignment_user_files_on_assignment_file_id"
    t.index ["assignment_user_id", "assignment_file_id"], name: "auf_au_id_af_id_index", unique: true
    t.index ["assignment_user_id"], name: "index_assignment_user_files_on_assignment_user_id"
  end

  create_table "assignment_user_private_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "diff"
    t.boolean "status", default: false
    t.bigint "assignment_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_user_id"], name: "index_assignment_user_private_results_on_assignment_user_id"
  end

  create_table "assignment_user_public_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "diff"
    t.boolean "status", default: false
    t.bigint "assignment_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_user_id"], name: "index_assignment_user_public_results_on_assignment_user_id"
  end

  create_table "assignment_user_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.bigint "user_id", null: false
    t.bigint "assignment_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id", "user_id"], name: "index_assignment_user_results_on_assignment_id_and_user_id", unique: true
    t.index ["assignment_id"], name: "index_assignment_user_results_on_assignment_id"
    t.index ["assignment_user_id"], name: "index_assignment_user_results_on_assignment_user_id"
    t.index ["user_id", "assignment_id"], name: "index_assignment_user_results_on_user_id_and_assignment_id", unique: true
    t.index ["user_id"], name: "index_assignment_user_results_on_user_id"
  end

  create_table "assignment_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.bigint "user_id", null: false
    t.integer "public_score", default: 0
    t.integer "private_score", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "public_n_exps", default: 0
    t.integer "private_n_exps", default: 0
    t.integer "compilation_error", default: 0
    t.index ["assignment_id", "user_id"], name: "index_assignment_users_on_assignment_id_and_user_id"
    t.index ["assignment_id"], name: "index_assignment_users_on_assignment_id"
    t.index ["user_id", "assignment_id"], name: "index_assignment_users_on_user_id_and_assignment_id"
    t.index ["user_id"], name: "index_assignment_users_on_user_id"
  end

  create_table "assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id", null: false
    t.timestamp "init_time"
    t.timestamp "end_time"
    t.string "docker_image"
    t.integer "revision_grade_percentage"
    t.integer "private_grade_percentage"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["deleted_at"], name: "index_assignments_on_deleted_at"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "short_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_courses_on_deleted_at"
    t.index ["short_id"], name: "index_courses_on_short_id"
  end

  create_table "courses_professors", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "professor_id", null: false
    t.index ["course_id", "professor_id"], name: "index_courses_professors_on_course_id_and_professor_id", unique: true
    t.index ["course_id"], name: "index_courses_professors_on_course_id"
    t.index ["professor_id", "course_id"], name: "index_courses_professors_on_professor_id_and_course_id", unique: true
    t.index ["professor_id"], name: "index_courses_professors_on_professor_id"
  end

  create_table "courses_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.index ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id", unique: true
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id", "course_id"], name: "index_courses_users_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "professor_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.bigint "course_id", null: false
    t.integer "state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id", "professor_id"], name: "index_professor_subscriptions_on_course_id_and_professor_id", unique: true
    t.index ["course_id"], name: "index_professor_subscriptions_on_course_id"
    t.index ["professor_id", "course_id"], name: "index_professor_subscriptions_on_professor_id_and_course_id", unique: true
    t.index ["professor_id"], name: "index_professor_subscriptions_on_professor_id"
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "dni"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_professors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_professors_on_reset_password_token", unique: true
  end

  create_table "user_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.integer "state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id", "user_id"], name: "index_user_subscriptions_on_course_id_and_user_id", unique: true
    t.index ["course_id"], name: "index_user_subscriptions_on_course_id"
    t.index ["user_id", "course_id"], name: "index_user_subscriptions_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "dni"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignment_files", "assignments"
  add_foreign_key "assignment_user_files", "assignment_files"
  add_foreign_key "assignment_user_files", "assignment_users"
  add_foreign_key "assignment_user_private_results", "assignment_users"
  add_foreign_key "assignment_user_public_results", "assignment_users"
  add_foreign_key "assignment_user_results", "assignment_users"
  add_foreign_key "assignment_user_results", "assignments"
  add_foreign_key "assignment_user_results", "users"
  add_foreign_key "assignment_users", "assignments"
  add_foreign_key "assignment_users", "users"
  add_foreign_key "assignments", "courses"
  add_foreign_key "professor_subscriptions", "courses"
  add_foreign_key "professor_subscriptions", "professors"
  add_foreign_key "user_subscriptions", "courses"
  add_foreign_key "user_subscriptions", "users"
end
