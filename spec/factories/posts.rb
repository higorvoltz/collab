# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    user
    category
  end
end
