# frozen_string_literal: true

module Private
  class Message < ApplicationRecord
    self.table_name = 'private_messages'
    after_create_commit do
      Private::MessageBroadcastJob.perform_later(self, previous_message)
    end
    belongs_to :user
    belongs_to :conversation,
               class_name: 'Private::Conversation'

    validates :body, presence: true

    def previous_message
      previous_message_index = conversation.messages.index(self) - 1
      conversation.messages[previous_message_index]
    end
  end
end
