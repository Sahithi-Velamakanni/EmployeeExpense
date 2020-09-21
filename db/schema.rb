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

ActiveRecord::Schema.define(version: 2020_09_21_155646) do

  create_table "bill_details", force: :cascade do |t|
    t.integer "invoice_no"
    t.datetime "date_of_expense"
    t.string "description"
    t.float "amount"
    t.integer "emplyoee_detail_id"
    t.binary "related_pdfs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expense_id"
    t.string "status"
    t.index ["emplyoee_detail_id"], name: "index_bill_details_on_emplyoee_detail_id"
    t.index ["expense_id"], name: "index_bill_details_on_expense_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commentable_id"
    t.string "commentable_type"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
  end

  create_table "employee_details", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emplyoee_details", force: :cascade do |t|
    t.string "department"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "emplyoee_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emplyoee_detail_id"], name: "index_expenses_on_emplyoee_detail_id"
  end

end
