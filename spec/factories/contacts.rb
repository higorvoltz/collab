# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    user factory: %i[user]
    contact factory: %i[user]
  end
end
