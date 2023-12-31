# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  let(:user) { create(:user) }

  it 'user navigates to the login page and succesfully logs in',
     js: true do
    user
    visit root_path
    find('nav a', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click
    expect(page).to have_selector('#user-settings')
  end
end
