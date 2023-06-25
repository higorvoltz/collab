# frozen_string_literal: true

module Private
  class Conversation < ApplicationRecord
    self.table_name = 'private_conversations'

    has_many :messages,
             class_name: 'Private::Message'
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'

    scope :between_users, lambda { |user1_id, user2_id|
      where(sender_id: user1_id, recipient_id: user2_id).or(
        where(sender_id: user2_id, recipient_id: user1_id)
      )
    }

    scope :all_by_user, lambda { |user_id|
      where(recipient_id: user_id).or(where(sender_id: user_id))
    }

    def opposed_user(user)
      user == recipient ? sender : recipient
    end
  end
end
