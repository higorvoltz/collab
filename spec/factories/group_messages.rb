# frozen_string_literal: true

FactoryBot.define do
  factory :group_message, class: 'Group::Message' do
    content { 'a' * 20 }
    conversation factory: %i[group_conversation]
    user
  end
end
