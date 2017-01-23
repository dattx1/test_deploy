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

ActiveRecord::Schema.define(version: 20170122070755) do

  create_table "assignment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "device_id",     null: false
    t.integer "assignment_id"
    t.index ["assignment_id"], name: "index_assignment_details_on_assignment_id", using: :btree
    t.index ["device_id", "assignment_id"], name: "index_assignment_details_on_device_id_and_assignment_id", unique: true, using: :btree
    t.index ["device_id"], name: "index_assignment_details_on_device_id", using: :btree
  end

  create_table "assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "assignee_id",              null: false
    t.string   "description", limit: 4000
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "request_id"
    t.index ["assignee_id"], name: "fk_rails_195e0ee33e", using: :btree
    t.index ["request_id"], name: "index_assignments_on_request_id", using: :btree
  end

  create_table "comment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "comment_id"
    t.index ["comment_id"], name: "index_comment_details_on_comment_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "object_id"
    t.integer  "comment_type"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "value"
    t.string   "name"
    t.string   "description", limit: 4000
    t.integer  "manager_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["manager_id"], name: "fk_rails_6aa8327bd5", using: :btree
  end

  create_table "device_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            limit: 100, null: false
    t.string   "template_code",   limit: 100
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "device_group_id",             null: false
    t.index ["device_group_id"], name: "index_device_categories_on_device_group_id", using: :btree
  end

  create_table "device_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 100
    t.string   "description", limit: 4000
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "device_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100
    t.integer  "value"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "device_code",        null: false
    t.string   "production_name",    null: false
    t.string   "model_number",       null: false
    t.string   "serial_number",      null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "device_status_id",   null: false
    t.integer  "device_category_id", null: false
    t.integer  "invoice_id",         null: false
    t.index ["device_category_id"], name: "index_devices_on_device_category_id", using: :btree
    t.index ["device_status_id"], name: "index_devices_on_device_status_id", using: :btree
    t.index ["invoice_id"], name: "index_devices_on_invoice_id", using: :btree
  end

  create_table "dms_objects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Object_Name", limit: 200
    t.integer  "Created_By"
    t.integer  "Updated_By"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "invoice_number", limit: 100
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "is_create"
    t.boolean  "is_update"
    t.boolean  "is_get"
    t.boolean  "is_delete"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "dms_object_id"
    t.integer  "role_id"
    t.index ["dms_object_id"], name: "index_permissions_on_dms_object_id", using: :btree
    t.index ["role_id"], name: "index_permissions_on_role_id", using: :btree
  end

  create_table "request_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "description",        limit: 4000
    t.integer "request_id",                      null: false
    t.integer "device_category_id",              null: false
    t.index ["device_category_id"], name: "index_request_details_on_device_category_id", using: :btree
    t.index ["request_id"], name: "index_request_details_on_request_id", using: :btree
  end

  create_table "request_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100
    t.integer  "value"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "request_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "assignee_id",                    null: false
    t.string   "title",             limit: 500
    t.string   "description",       limit: 4000
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "request_type_id",                null: false
    t.integer  "request_status_id",              null: false
    t.index ["assignee_id"], name: "fk_rails_bb7befbc8d", using: :btree
    t.index ["request_status_id"], name: "index_requests_on_request_status_id", using: :btree
    t.index ["request_type_id"], name: "index_requests_on_request_type_id", using: :btree
  end

  create_table "return_device_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "return_device_id", null: false
    t.integer "device_id",        null: false
    t.index ["device_id"], name: "index_return_device_details_on_device_id", using: :btree
    t.index ["return_device_id"], name: "index_return_device_details_on_return_device_id", using: :btree
  end

  create_table "return_devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "returnee_id",              null: false
    t.string   "description", limit: 4000
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["returnee_id"], name: "fk_rails_8ef6b7f0dc", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "value",      null: false
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "address"
    t.string   "password_digest"
    t.string   "reset_digest"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "department_id"
    t.string   "remember_digest"
    t.string   "avatar"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
  end

  add_foreign_key "assignment_details", "assignments"
  add_foreign_key "assignment_details", "devices"
  add_foreign_key "assignments", "requests"
  add_foreign_key "assignments", "users", column: "assignee_id"
  add_foreign_key "comment_details", "comments"
  add_foreign_key "departments", "users", column: "manager_id"
  add_foreign_key "device_categories", "device_groups"
  add_foreign_key "devices", "device_categories"
  add_foreign_key "devices", "device_statuses"
  add_foreign_key "devices", "invoices"
  add_foreign_key "permissions", "dms_objects"
  add_foreign_key "permissions", "roles"
  add_foreign_key "request_details", "device_categories"
  add_foreign_key "request_details", "requests"
  add_foreign_key "requests", "request_statuses"
  add_foreign_key "requests", "request_types"
  add_foreign_key "requests", "users", column: "assignee_id"
  add_foreign_key "return_device_details", "devices"
  add_foreign_key "return_device_details", "return_devices"
  add_foreign_key "return_devices", "users", column: "returnee_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "departments"
end
