# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactRequestBroadcastJob, type: :job do
  describe '#perform_later' do
    let(:contact_request) { create(:contact) }

    it 'enqueues a job' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        contact_request
      end.to have_enqueued_job
    end
  end
end
