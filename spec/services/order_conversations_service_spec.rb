# frozen_string_literal: true

require 'rails_helper'
require './app/services/order_conversations_service'

describe OrderConversationsService do
  describe '#call' do
    it 'returns ordered conversations in descending order' do
      user = create(:user)
      conversation1 = create(:private_conversation,
                             sender_id: user.id,
                             messages: create_list(:private_message, 1))
      conversation2 = create(:group_conversation,
                             users: [user],
                             messages: create_list(:group_message, 1))
      conversation3 = create(:private_conversation,
                             sender_id: user.id,
                             messages: create_list(:private_message, 1))
      conversations = [conversation3, conversation2, conversation1]
      expect(described_class.new({ user: }).call).to eq conversations
    end
  end
end
