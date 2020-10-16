RSpec.describe Structurely::Clients::Conversations do
  subject { described_class.new }

  describe "#headers" do
    specify { expect(subject.headers[:"Content-Type"]).to eq("application/json") }
    specify { expect(subject.headers[:"X-Api-Authorization"]).to eq("test") }
    specify { expect(subject.api_root).to eq("https://api.staging.structurely.com/v1") }
  end

  describe "#show" do
    it "return the record when the record exists" do
      stub = stub_request(:get, /conversations/).to_return(status: 200, body: load_json("conversations_get").to_json)

      response = subject.show("5c09a4416241ea2c293275b8")

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
    end

    it "returns nil when the record does not exist" do
      stub = stub_request(:get, /conversations/)
        .to_return(status: 404, body: {
          code: 404, message: "Conversation does not exist"
        }.to_json)

      response = subject.show("foobar")

      expect(stub).to have_been_requested
      expect(response.success?).to be_falsey
      expect(response.failure).not_to be_nil

      expect(response.failure.status).to eq(404)
    end
  end

  describe "#create" do
  end
end
