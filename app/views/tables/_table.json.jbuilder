# frozen_string_literal: true

json.extract! table, :id, :table_number, :company_id, :created_at, :updated_at
json.url table_url(table, format: :json)
