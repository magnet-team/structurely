RSpec.describe Structurely::Entities::ConversationItem do
  subject { described_class }
  let(:now) { DateTime.now }
  let(:message) { Structurely::Entities::ConversationMessage.new(text: "foo", received: now).to_hash }
  let(:response) { Structurely::Entities::ConversationMessage.new(text: "bar", received: now).to_hash }
  let(:item) { subject.new(message: message, response: response, context: "baz") }

  describe "#message" do
    it { expect(item.message).to eq(message) }
    it { expect(item.message.class).to eq(Structurely::Entities::ConversationMessage) }
  end

  describe "#response" do
    it { expect(item.response).to eq(response) }
    it { expect(item.response.class).to eq(Structurely::Entities::ConversationMessage) }
  end

  describe "#response" do
    it { expect(item.context).to eq("baz") }
  end

  describe "#entity" do
    it { expect(item.entity.class).to eq(Hashie::Mash) }
  end
end
