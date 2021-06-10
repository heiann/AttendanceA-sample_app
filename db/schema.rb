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

ActiveRecord::Schema.define(version: 20210610023600) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "change"
    t.datetime "overtime_in"
    t.datetime "overtime_end"
    t.string "overtime_memo"
    t.time "overtime"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bases", force: :cascade do |t|
    t.integer "base_id"
    t.string "base_name"
    t.string "base_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bases_on_user_id"
  end

  create_table "month_approvals", force: :cascade do |t|
    t.integer "applicant_user_id"
    t.integer "approval_superior_id"
    t.integer "approval_status"
    t.datetime "approval_month"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_month_approvals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.string "department"
    t.datetime "basic_time", default: "2021-05-19 23:00:00"
    t.datetime "work_start_time"
    t.datetime "work_end_time"
    t.string "uid"
    t.integer "employee_number"
    t.string "affiliation"
    t.boolean "superior"
    t.datetime "over_work_in"
    t.datetime "overwork_end"
    t.string "superior_affiliation"
  end

end
