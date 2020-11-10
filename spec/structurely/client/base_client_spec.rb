# frozen_string_literal: true

require "spec_helper"

module Structurely
  module Client
    RSpec.describe BaseClient do
      subject { described_class.new }

      describe "#headers" do
        before { stub_const("Structurely::DEFAULT_CONTENT_TYPE", "foo") }
        it { expect(subject.headers[:"Content-Type"]).to eq("foo") }

        context "when api_key is set" do
          before { Structurely.config.api_key = "bar" }
          it { expect(subject.headers[:"X-Api-Authorization"]).to eq("bar") }
        end

        context "when api_key is set" do
          before { Structurely.config.api_key = nil }
          it { expect(subject.headers[:"X-Api-Authorization"]).to eq("") }
        end
      end

      describe "#api_root" do
        context "when api_endpoint is set" do
          before { Structurely.config.api_endpoint = "bar" }
          it { expect(subject.api_root).to eq("bar") }
        end
      end
    end
  end
end
