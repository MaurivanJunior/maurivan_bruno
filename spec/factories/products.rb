# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    quantity { 1.5 }
    name { 'MyString' }
    description { 'MyText' }
    company { nil }
  end
end
