# frozen_string_literal: true

require "spec_helper"

module Structurely
  RSpec.describe "User-friendly errors" do
    it "raises a readable error on failed requests", vcr: {cassette_name: :conversation_not_found} do
      expect { Entity::Conversation.show("nonexistent") }.to raise_error(RequestError, "Conversation does not exist")
    end

    it "raises readable errors with incorrect 200 responses", vcr: {cassette_name: :authentication_error} do
      Structurely.config.api_key = "test"
      begin
        Entity::Conversation.show("nonexistent")
      rescue => e
        expect(e.to_s).to include("Invalid API key provided")
      end
    end
  end
end
