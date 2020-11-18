# frozen_string_literal: true

FactoryBot.define do
  factory :demand do
    table { nil }
    product { nil }
    product_quantity { 1 }
  end
end
