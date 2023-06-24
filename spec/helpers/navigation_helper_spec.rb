# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NavigationHelper, type: :helper do
  context 'when signed in user' do
    before { allow(helper).to receive(:user_signed_in?).and_return(true) }

    describe '#collapsible_links_partial_path' do
      it 'returns signed in links partial path' do
        expect(helper.collapsible_links_partial_path).to(
          eq 'layouts/navigation/collapsible_elements/signed_in_links'
        )
      end
    end
  end

  context 'when non-signed in user' do
    before { allow(helper).to receive(:user_signed_in?).and_return(false) }

    describe '#collapsible_links_partial_path' do
      it 'returns non signed in links partial path' do
        expect(helper.collapsible_links_partial_path).to(
          eq 'layouts/navigation/collapsible_elements/non_signed_in_links'
        )
      end
    end
  end
end
