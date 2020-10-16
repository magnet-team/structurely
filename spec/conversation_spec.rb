RSpec.describe Structurely::Conversation do
  subject { described_class }

  describe ".show" do
    context "when conversation exists" do
      before { stub_request(:get, /conversations/).to_return(status: 200, body: load_json("conversations_get").to_json) }

      it "description" do
        response = subject.show("5c09a4416241ea2c293275b8")
        expect(response.success?).to be_truthy
        expect(response.muted).to be_falsey
      end
    end

    context "when conversation does not exist" do
    end
  end
end
