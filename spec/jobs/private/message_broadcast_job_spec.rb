# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Private::MessageBroadcastJob, type: :job do
  describe '#perform_later' do
    let(:message) { create(:private_message) }

    it 'enqueues a job' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        message
      end.to have_enqueued_job
    end
  end
end
