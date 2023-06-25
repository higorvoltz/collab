# frozen_string_literal: true

module Group
  class Conversation < ApplicationRecord
    self.table_name = 'group_conversations'

    has_and_belongs_to_many :users
    has_many :messages,
             class_name: 'Group::Message',
             dependent: :destroy
  end
end
