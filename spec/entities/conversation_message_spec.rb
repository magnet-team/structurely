RSpec.describe Structurely::Entities::ConversationMessage do
  subject { described_class }
  let(:metadata) { Structurely::Entities::MessageMetaData.new(context: "baz").to_hash }
  let(:now) { DateTime.now }
  let(:message) { subject.new(text: "foo", received: now, _metadata: metadata) }

  describe "#text" do
    it { expect(message.text).to eq("foo") }
  end

  describe "#received" do
    it { expect(message.received).to eq(now) }
    it { expect(message.received.class).to eq(DateTime) }
  end

  describe "#_metadata" do
    it { expect(message._metadata).to eq(metadata) }
    it { expect(message._metadata.class).to eq(Structurely::Entities::MessageMetaData) }
  end

  describe "#entity" do
    it { expect(message.entity.class).to eq(Hashie::Mash) }
  end
end
