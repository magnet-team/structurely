RSpec.describe Structurely::Entities::ConversationSlot do
  subject { described_class }
  let(:slot) { subject.new(name: "foo", value: "bar") }

  describe "#name" do
    it { expect(slot.name).to eq("foo") }
  end

  describe "#value" do
    it { expect(slot.value).to eq("bar") }
  end

  describe "#entity" do
    it { expect(slot.entity.class).to eq(Hashie::Mash) }
  end
end
