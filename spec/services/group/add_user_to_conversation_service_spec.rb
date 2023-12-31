# frozen_string_literal: true

require 'rails_helper'
require './app/services/group/add_user_to_conversation_service'

describe Group::AddUserToConversationService do
  describe '#call' do
    let(:user) { create(:user) }
    let(:new_user) { create(:user) }
    let(:conversation) { create(:group_conversation, users: [user]) }
    let(:add_user_to_conversation) do
      described_class.new({
                            conversation_id: conversation.id,
                            new_user_id: new_user.id,
                            added_by_id: user.id
                          }).call
    end

    it 'adds user to a group conversation' do
      add_user_to_conversation
      conversation_users = Group::Conversation.find(conversation.id).users
      expect(conversation_users).to include new_user
    end

    it 'creates an informational message' do
      add_user_to_conversation
      group_conversation = Group::Conversation.find(conversation.id)
      expect(group_conversation.messages.count).to eq 1
    end
  end
end
