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

ActiveRecord::Schema.define(version: 20150603181617) do

  create_table "articles", force: true do |t|
    t.string   "nombre"
    t.string   "marca"
    t.string   "color"
    t.text     "descripcion"
    t.string   "lugar"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "busca"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "petitions", force: true do |t|
    t.boolean  "encontrado_a"
    t.boolean  "solicitado_a"
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "razon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "petitions", ["article_id"], name: "index_petitions_on_article_id"
  add_index "petitions", ["user_id"], name: "index_petitions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "usuario"
    t.string   "password"
    t.string   "correo"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["usuario"], name: "index_users_on_usuario", unique: true

end
