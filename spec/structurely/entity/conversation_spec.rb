# frozen_string_literal: true

require "spec_helper"

module Structurely
  module Entity
    RSpec.describe Conversation do
      subject { Conversation }

      describe "#create", vcr: {cassette_name: :conversation_create} do
        it "represents a conversation as an entity" do
          conversation = subject.create(
            muted: false,
            settings: {"holmesName": "Aisa"},
            slots: [{"name": "email", "value": "test@example.com"}]
          )

          %i[id muted settings slots stages].each do |field|
            expect(conversation[field]).not_to be_nil
          end
        end
      end

      describe "#show", vcr: {cassette_name: :conversation_show} do
        before do
          @conversation = Conversation.show("5f89abd220c8880031b975cc")
        end

        it { expect(@conversation).to be_kind_of Structurely::Entity::Conversation }
        it { expect(@conversation.id).to_not be_nil }
        it { expect(@conversation.muted).to_not be_nil }
        it { expect(@conversation.settings).to_not be_nil }
        it { expect(@conversation.settings.allowed_domains).to_not be_nil }
        it { expect(@conversation.settings.drip_campaign_enabled).to_not be_nil }
        it { expect(@conversation.settings.holmes_name).to_not be_nil }
        it { expect(@conversation.settings.lead_types).to_not be_nil }
        it { expect(@conversation.settings.re_drips_enabled).to_not be_nil }
        it { expect(@conversation.settings.time_zone).to_not be_nil }
        it { expect(@conversation.slots).to_not be_nil }
        it { expect(@conversation.slots.first.name).to_not be_nil }
        it { expect(@conversation.slots.first.value).to_not be_nil }
      end
    end
  end
end
