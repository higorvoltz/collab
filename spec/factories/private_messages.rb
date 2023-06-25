# frozen_string_literal: true

FactoryBot.define do
  factory :private_message, class: 'Private::Message' do
    body { 'a' * 20 }
    conversation factory: %i[private_conversation]
    user
  end
end
