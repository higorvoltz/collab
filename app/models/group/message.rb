# frozen_string_literal: true

module Group
  class Message < ApplicationRecord
    serialize :seen_by, Array
    serialize :added_new_users, Array
    self.table_name = 'group_messages'

    belongs_to  :conversation,
                class_name: 'Group::Conversation'
    belongs_to :user

    validates :content, presence: true

    default_scope { includes(:user) }

    # get a previous message of a conversation
    def previous_message
      previous_message_index = conversation.messages.index(self) - 1
      conversation.messages[previous_message_index]
    end
  end
end
