RSpec.describe Structurely::Clients::Conversations do
  subject { described_class.new }

  describe "#show" do
    it "return the record when the record exists" do
      stub_request(:get, /conversations/)
        .to_return(status: 200, body: load_json("conversations_get").to_json)

      response = subject.show("5c09a4416241ea2c293275b8")
      expect(response.success?).to be_truthy
      expect(response.value[:id]).to eq("5c09a4416241ea2c293275b8")
    end

    it "returns nil when the record does not exist" do
      stub_request(:get, /conversations/)
        .to_return(status: 404, body: {
          code: 404, message: "Conversation does not exist"
        }.to_json)

      response = subject.show("foobar")
      expect(response.success?).to be_falsey
      expect(response.value.status.code).to eq(404)
      expect(response.value.body[:message]).to eq("Conversation does not exist")
    end
  end

  describe "#create" do
  end
end
