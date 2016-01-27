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

ActiveRecord::Schema.define(version: 20160111100915) do

  create_table "beta_subscribers", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
  end

  add_index "beta_subscribers", ["email"], name: "email", using: :btree

  create_table "cluster_access", force: :cascade do |t|
    t.integer  "cluster_id", limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
  end

  add_index "cluster_access", ["cluster_id"], name: "cluster_id", using: :btree
  add_index "cluster_access", ["created_at"], name: "created_at", using: :btree
  add_index "cluster_access", ["user_id"], name: "user_id", using: :btree

  create_table "cluster_ports", force: :cascade do |t|
    t.integer "cluster_id", limit: 4,             null: false
    t.integer "service_id", limit: 4,             null: false
    t.integer "port_out",   limit: 4, default: 0, null: false
    t.integer "port_in",    limit: 4,             null: false
  end

  add_index "cluster_ports", ["cluster_id"], name: "cluster_id", using: :btree
  add_index "cluster_ports", ["service_id"], name: "service_id", using: :btree

  create_table "cluster_services", force: :cascade do |t|
    t.string  "name",     limit: 255,                null: false
    t.string  "title",    limit: 255,                null: false
    t.boolean "enabled",              default: true, null: false
    t.integer "port",     limit: 4,                  null: false
    t.string  "protocol", limit: 255,                null: false
  end

  add_index "cluster_services", ["name"], name: "name", unique: true, using: :btree

  create_table "clusters", force: :cascade do |t|
    t.string  "uid",                   limit: 255,                  null: false
    t.string  "name",                  limit: 255
    t.string  "domainname",            limit: 255
    t.string  "title",                 limit: 255
    t.integer "team_id",               limit: 4,                    null: false
    t.integer "primary_admin_user_id", limit: 4,                    null: false
    t.integer "status",                limit: 1,     default: 0,    null: false
    t.text    "description",           limit: 65535
    t.boolean "is_public",                           default: true, null: false
    t.integer "last_node_number",      limit: 4,     default: 0,    null: false
  end

  add_index "clusters", ["domainname"], name: "systemname", unique: true, using: :btree
  add_index "clusters", ["name"], name: "name", unique: true, using: :btree
  add_index "clusters", ["primary_admin_user_id"], name: "primary_admin_id", using: :btree
  add_index "clusters", ["team_id"], name: "team_id", using: :btree
  add_index "clusters", ["uid"], name: "uid", using: :btree

  create_table "clusters_containers", force: :cascade do |t|
    t.integer "container_id", limit: 4,   null: false
    t.integer "cluster_id",   limit: 8,   null: false
    t.integer "node_id",      limit: 8
    t.string  "ip",           limit: 255
    t.string  "host",         limit: 255
  end

  add_index "clusters_containers", ["cluster_id"], name: "cluster_id", using: :btree
  add_index "clusters_containers", ["container_id"], name: "container_id", using: :btree
  add_index "clusters_containers", ["host"], name: "host", using: :btree
  add_index "clusters_containers", ["ip"], name: "ip", using: :btree
  add_index "clusters_containers", ["node_id"], name: "node_id", using: :btree

  create_table "cms_languages", force: :cascade do |t|
    t.string  "title",     limit: 250
    t.string  "lang",      limit: 4
    t.boolean "enabled",               default: true,              null: false
    t.string  "charset",   limit: 15,  default: "utf8_unicode_ci", null: false
    t.string  "locale",    limit: 255,                             null: false
    t.string  "lang_html", limit: 10,                              null: false
    t.integer "pos",       limit: 4,                               null: false
    t.string  "countries", limit: 255,                             null: false
  end

  add_index "cms_languages", ["lang"], name: "idxLang", unique: true, using: :btree

  create_table "cms_mediafiles", force: :cascade do |t|
    t.integer  "media_type",         limit: 4
    t.string   "path",               limit: 255
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "cms_pages", force: :cascade do |t|
    t.string   "title",             limit: 255,                 null: false
    t.string   "name",              limit: 255
    t.string   "url",               limit: 255
    t.integer  "url_parts_count",   limit: 1,   default: 0,     null: false
    t.integer  "url_vars_count",    limit: 1,   default: 0,     null: false
    t.string   "parsed_url",        limit: 255
    t.integer  "parent_id",         limit: 4,   default: 0,     null: false
    t.string   "view_path",         limit: 255
    t.boolean  "is_translated",                 default: false, null: false
    t.integer  "status",            limit: 4,   default: 0,     null: false
    t.integer  "pos",               limit: 4,   default: 0,     null: false
    t.string   "redir_url",         limit: 255
    t.integer  "template_id",       limit: 4
    t.integer  "layout_id",         limit: 4
    t.integer  "owner",             limit: 4
    t.boolean  "is_folder",                     default: false, null: false
    t.string   "controller_action", limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "enabled",           limit: 1,   default: 1,     null: false
  end

  add_index "cms_pages", ["name"], name: "index_cms_pages_on_name", using: :btree
  add_index "cms_pages", ["parent_id"], name: "parent_id", using: :btree
  add_index "cms_pages", ["status"], name: "status", using: :btree
  add_index "cms_pages", ["url"], name: "url", using: :btree

  create_table "cms_pages_translation", force: :cascade do |t|
    t.integer "item_id",           limit: 4,     default: 0, null: false
    t.integer "page_id",           limit: 4
    t.string  "lang",              limit: 5,                 null: false
    t.string  "meta_title",        limit: 255
    t.text    "meta_description",  limit: 65535
    t.string  "meta_keywords",     limit: 255
    t.string  "template_filename", limit: 255
  end

  add_index "cms_pages_translation", ["item_id"], name: "item_id", using: :btree
  add_index "cms_pages_translation", ["lang"], name: "lang", using: :btree
  add_index "cms_pages_translation", ["template_filename"], name: "template", using: :btree

  create_table "cms_templates", force: :cascade do |t|
    t.string   "title",         limit: 255,                 null: false
    t.string   "name",          limit: 255
    t.string   "basename",      limit: 255,                 null: false
    t.string   "basepath",      limit: 255,                 null: false
    t.string   "basedirpath",   limit: 255,                 null: false
    t.integer  "type_id",       limit: 1
    t.string   "tpl_format",    limit: 255
    t.integer  "pos",           limit: 4
    t.boolean  "is_translated",             default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_folder",                 default: false, null: false
    t.boolean  "enabled",                   default: true,  null: false
    t.string   "ancestry",      limit: 255
  end

  add_index "cms_templates", ["ancestry"], name: "ancestry", using: :btree
  add_index "cms_templates", ["basepath"], name: "basepath", using: :btree
  add_index "cms_templates", ["pos"], name: "pos", using: :btree

  create_table "cms_templates_translation", force: :cascade do |t|
    t.integer "item_id", limit: 4, null: false
    t.string  "lang",    limit: 5, null: false
  end

  add_index "cms_templates_translation", ["item_id", "lang"], name: "item_id", unique: true, using: :btree

  create_table "cms_templatetypes", force: :cascade do |t|
    t.string  "name",  limit: 255
    t.string  "title", limit: 255
    t.integer "pos",   limit: 4,   null: false
  end

  create_table "cms_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_users", ["email"], name: "index_optimacms_cms_users_on_email", unique: true, using: :btree
  add_index "cms_users", ["reset_password_token"], name: "index_optimacms_cms_users_on_reset_password_token", unique: true, using: :btree

  create_table "containers", force: :cascade do |t|
    t.string  "name",    limit: 255,                null: false
    t.string  "title",   limit: 255,                null: false
    t.boolean "enabled",             default: true, null: false
  end

  add_index "containers", ["name"], name: "name", unique: true, using: :btree

  create_table "errors", force: :cascade do |t|
    t.string "name",        limit: 255,   null: false
    t.string "title",       limit: 255,   null: false
    t.string "category",    limit: 255
    t.text   "description", limit: 65535
  end

  add_index "errors", ["name"], name: "name", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.string  "name",    limit: 255,                null: false
    t.string  "title",   limit: 255,                null: false
    t.boolean "enabled",             default: true, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "uid",             limit: 255,             null: false
    t.integer  "from_user_id",    limit: 4
    t.integer  "team_id",         limit: 4
    t.integer  "cluster_id",      limit: 4
    t.string   "to_email",        limit: 255,             null: false
    t.integer  "status",          limit: 4,               null: false
    t.integer  "invitation_type", limit: 4,   default: 0, null: false
    t.datetime "activated_at"
    t.datetime "created_at",                              null: false
  end

  add_index "invitations", ["from_user_id"], name: "user_id", using: :btree
  add_index "invitations", ["team_id"], name: "cluster_id", using: :btree
  add_index "invitations", ["uid"], name: "uid", unique: true, using: :btree

  create_table "message_dialogs", force: :cascade do |t|
    t.integer  "from_user_id",    limit: 4, null: false
    t.integer  "to_user_id",      limit: 4, null: false
    t.integer  "last_message_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "message_dialogs", ["created_at"], name: "created_at", using: :btree
  add_index "message_dialogs", ["from_user_id"], name: "from_user_id", using: :btree
  add_index "message_dialogs", ["to_user_id"], name: "to_user_id", using: :btree
  add_index "message_dialogs", ["updated_at"], name: "updated_at", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "dialog_id",    limit: 4,                 null: false
    t.integer  "from_user_id", limit: 4,                 null: false
    t.integer  "to_user_id",   limit: 4,                 null: false
    t.datetime "created_at",                             null: false
    t.integer  "status",       limit: 1,     default: 1, null: false
    t.text     "message",      limit: 65535,             null: false
  end

  add_index "messages", ["from_user_id", "to_user_id"], name: "from_user_id", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string  "uid",         limit: 255,               null: false
    t.string  "name",        limit: 255
    t.integer "cluster_id",  limit: 4,                 null: false
    t.integer "node_number", limit: 4,     default: 0, null: false
    t.string  "ip",          limit: 255
    t.integer "port",        limit: 4,     default: 0, null: false
    t.string  "agent_token", limit: 255
    t.integer "status",      limit: 1,     default: 0, null: false
    t.text    "system_info", limit: 65535,             null: false
  end

  add_index "nodes", ["agent_token"], name: "agent_token", using: :btree
  add_index "nodes", ["cluster_id"], name: "cluster_id", using: :btree
  add_index "nodes", ["name"], name: "name", using: :btree
  add_index "nodes", ["uid"], name: "uid", using: :btree

  create_table "options", force: :cascade do |t|
    t.string  "name",        limit: 250,      default: "",   null: false
    t.string  "title",       limit: 250,      default: "",   null: false
    t.string  "option_type", limit: 100,      default: "",   null: false
    t.text    "description", limit: 16777215
    t.boolean "is_changed",                   default: true, null: false
    t.string  "category",    limit: 250,      default: "",   null: false
    t.string  "value",       limit: 250,      default: "",   null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string  "name",         limit: 255,             null: false
    t.string  "command_name", limit: 255,             null: false
    t.string  "v",            limit: 255,             null: false
    t.integer "status",       limit: 4,   default: 1, null: false
  end

  add_index "packages", ["name"], name: "name", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer "cluster_id", limit: 4, null: false
    t.integer "package_id", limit: 4, null: false
    t.integer "ssh_port",   limit: 4, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",                  limit: 255,               null: false
    t.string   "uid",                   limit: 255,               null: false
    t.integer  "status",                limit: 1,     default: 1, null: false
    t.text     "about",                 limit: 65535
    t.integer  "primary_admin_user_id", limit: 4
    t.integer  "main_cluster_id",       limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "avatar_file_name",      limit: 255
    t.string   "avatar_content_type",   limit: 255
    t.integer  "avatar_file_size",      limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "teams", ["created_at"], name: "created_at", using: :btree
  add_index "teams", ["name"], name: "name", unique: true, using: :btree
  add_index "teams", ["primary_admin_user_id"], name: "primary_admin_user_id", using: :btree
  add_index "teams", ["uid"], name: "uid", unique: true, using: :btree
  add_index "teams", ["uid"], name: "uid_2", unique: true, using: :btree
  add_index "teams", ["updated_at"], name: "updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255,                null: false
    t.string   "email",                  limit: 255,                null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.integer  "status",                 limit: 1,     default: 0,  null: false
    t.integer  "team_id",                limit: 4,                  null: false
    t.integer  "group_id",               limit: 4,                  null: false
    t.integer  "main_cluster_id",        limit: 4
    t.string   "firstname",              limit: 255,                null: false
    t.string   "lastname",               limit: 255,                null: false
    t.text     "about",                  limit: 65535
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        limit: 4,     default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "invitation_id",          limit: 4
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "email", using: :btree
  add_index "users", ["group_id"], name: "group_id", using: :btree
  add_index "users", ["main_cluster_id"], name: "main_cluster_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "team_id", using: :btree
  add_index "users", ["username"], name: "username", using: :btree

end
