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

ActiveRecord::Schema.define(version: 20180406025525) do

  create_table "bill_details", force: :cascade do |t|
    t.integer "Product_id"
    t.integer "Bill_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Bill_id"], name: "index_bill_details_on_Bill_id"
    t.index ["Product_id"], name: "index_bill_details_on_Product_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "User_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_bills_on_User_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "Product_id"
    t.integer "User_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id", "User_id"], name: "comments_product_user"
    t.index ["Product_id"], name: "index_comments_on_Product_id"
    t.index ["User_id"], name: "index_comments_on_User_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.integer "price"
    t.integer "quantity"
    t.text "description"
    t.text "image"
    t.text "content"
    t.integer "Category_id"
    t.integer "Brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Brand_id"], name: "index_products_on_Brand_id"
    t.index ["Category_id"], name: "index_products_on_Category_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "Product_id"
    t.integer "User_id"
    t.integer "rate_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_rates_on_Product_id"
    t.index ["User_id"], name: "index_rates_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.string "avatar_url", default: "avatar_default.png"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
