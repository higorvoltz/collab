# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'when has_many Associations' do
    it 'has_many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
  end
end
