RSpec.describe Structurely::Entities::MessageMetaData do
  subject { described_class }
  let(:message) { subject.new(context: "foo") }

  describe "#name" do
    it { expect(message.context).to eq("foo") }
  end

  describe "#entity" do
    it { expect(message.entity.class).to eq(Hashie::Mash) }
  end
end
