# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create a new post', type: :feature do
  let(:user) { create(:user) }

  before { sign_in user }

  shared_examples 'user creates a new post' do |branch|
    it 'successfully' do
      create(:category, name: 'category', branch:)
      visit send("#{branch}_posts_path")
      find('.new-post-button').click
      fill_in 'post[title]', with: 'a' * 20
      fill_in 'post[content]', with: 'a' * 20
      select 'category', from: 'post[category_id]'
      click_on 'Create a post'
      expect(page).to have_selector('h3', text: 'a' * 20)
    end
  end

  include_examples 'user creates a new post', 'hobby'
  include_examples 'user creates a new post', 'study'
  include_examples 'user creates a new post', 'team'
end
