# frozen_string_literal: true

require 'rails_helper'
include Warden::Test::Helpers
RSpec.describe 'new', type: :request do
  context 'when non-signed in user' do
    it 'redirects to a root path' do
      get '/posts/new'
      expect(response).to redirect_to(root_path)
    end
  end

  context 'when signed in user' do
    let(:user) { create(:user) }

    before { login_as user }

    it 'renders a new template' do
      get '/posts/new'
      expect(response).to render_template(:new)
    end
  end
end
