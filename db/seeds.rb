# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all
Table.destroy_all
Product.destroy_all
Demand.destroy_all
I18n.locale = 'pt-BR'

2.times do |_index|
  Company.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph)
end

company = Company.find(Company.pluck(:id))

10.times do |_index|
  Table.create!(table_number: Faker::Number.unique.between(from: 1, to: 15), company_id: company.sample.id)
end

10.times do |_index|
  Product.create!(name: Faker::Restaurant.name, description: Faker::Lorem.paragraph,
                  quantity: Faker::Number.between(from: 1, to: 10), company_id: company.sample.id)
end

company1 = Company.first
company2 = Company.last

company_1_tables = Table.find(company1.tables.pluck(:id))
company_2_tables = Table.find(company2.tables.pluck(:id))

company_1_products = Product.find(company1.products.pluck(:id))
company_2_products = Product.find(company2.products.pluck(:id))

Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)
Demand.create!(product_id: company_1_products.sample.id, table_id: company_1_tables.sample.id, product_quantity: 3, company_id: company1.id)

Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
Demand.create!(product_id: company_2_products.sample.id, table_id: company_2_tables.sample.id, product_quantity: 3, company_id: company2.id)
