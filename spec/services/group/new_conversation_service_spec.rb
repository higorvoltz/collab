# frozen_string_literal: true

require 'rails_helper'
require './app/services/group/new_conversation_service'

describe Group::NewConversationService do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:new_user) { create(:user) }
  let(:private_conversation) do
    create(:private_conversation,
           sender_id: user1.id,
           recipient_id: user2.id)
  end

  describe '#call' do
    it 'returns a new created group conversation' do
      new_conversation = described_class.new({
                                               creator_id: user1.id,
                                               private_conversation_id: private_conversation.id,
                                               new_user_id: new_user.id
                                             }).call
      last_conversation = Group::Conversation.last
      expect(new_conversation).to eq last_conversation
      expect(last_conversation.messages.count).to eq 1
    end
  end
end
