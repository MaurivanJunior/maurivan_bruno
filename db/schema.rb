# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_923_025_740) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'demands', force: :cascade do |t|
    t.bigint 'table_id'
    t.bigint 'product_id'
    t.bigint 'company_id'
    t.integer 'product_quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_demands_on_company_id'
    t.index ['product_id'], name: 'index_demands_on_product_id'
    t.index ['table_id'], name: 'index_demands_on_table_id'
  end

  create_table 'products', force: :cascade do |t|
    t.float 'quantity'
    t.string 'name'
    t.text 'description'
    t.bigint 'company_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_products_on_company_id'
  end

  create_table 'tables', force: :cascade do |t|
    t.integer 'table_number'
    t.bigint 'company_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_tables_on_company_id'
  end
end
