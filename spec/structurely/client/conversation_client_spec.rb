# frozen_string_literal: true

require "spec_helper"

module Structurely
  module Client
    RSpec.describe ConversationClient do
      subject { described_class.new }

      describe "create", vcr: {cassette_name: :conversation_client_create} do
        it "creates a conversation" do
          response = subject.create(
            muted: false,
            settings: {"holmesName": "Andrew"},
            slots: [{"name": "email", "value": "test@example.com"}]
          )
          response_value = response.value!
          expect(response_value[:settings][:holmesName]).to eq("Andrew")
          expect(response_value[:slots]).not_to be_empty
        end
      end

      describe "show" do
        context "when the conversation exists" do
          it "retrieves a conversation with the specified ID", vcr: {cassette_name: :conversation_show_success} do
            conversation_id = "5f89abd220c8880031b975cc"
            response = subject.show(conversation_id)
            expect(response.success?).to be_truthy
            expect(response.value![:id]).to eq(conversation_id)
          end
        end

        context "when the conversation does not exist" do
          it "raises an error", vcr: {cassette_name: :conversation_show_failure} do
            expect { subject.show(SecureRandom.uuid) }.to raise_error(Structurely::Conversation::RequestError)
          end
        end
      end
    end
  end
end
