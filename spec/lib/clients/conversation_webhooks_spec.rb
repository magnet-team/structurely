RSpec.describe Structurely::Clients::ConversationWebhooks do
  subject { described_class.new }

  describe "#headers" do
    specify { expect(subject.headers[:"Content-Type"]).to eq("application/json") }
    specify { expect(subject.headers[:"X-Api-Authorization"]).to eq("test") }
    specify { expect(subject.api_root).to eq("https://api.test.structurely.com/v1") }
  end

  describe "#index" do
    it "returns success" do
      stub = stub_request(:get, /conversationWebhooks/).to_return(status: 200, body: load_json("conversation_webhooks_index").to_json)
      response = subject.index

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
      expect(response.failure?).to be_falsey
    end
  end

  describe "#show" do
    it "returns success" do
      stub = stub_request(:get, /conversationWebhooks/).to_return(status: 200, body: load_json("conversation_webhooks_get").to_json)
      response = subject.show("61046337d3b4410036e4a5aa")

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
      expect(response.failure?).to be_falsey
    end
  end

  describe "#create" do
    it "returns success" do
      stub = stub_request(:post, /conversationWebhooks/).to_return(status: 200, body: load_json("conversation_webhooks_post").to_json)
      response = subject.create(
        name: "my_conversations",
        target: "https://fp-local.ngrok.io",
        triggers: ["conversation:updated", "response:created"]
      )

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
      expect(response.failure?).to be_falsey
    end
  end

  describe "#update" do
    it "returns success" do
      stub = stub_request(:patch, /conversationWebhooks/).to_return(status: 200, body: load_json("conversation_webhooks_patch").to_json)
      response = subject.update("61046450056680015689595e", {name: "awesome_convos"})

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
      expect(response.failure?).to be_falsey
    end
  end

  describe "#destroy" do
    it "returns success" do
      stub = stub_request(:delete, /conversationWebhooks/).to_return(status: 204)
      response = subject.destroy("61046450056680015689595e")

      expect(stub).to have_been_requested
      expect(response.success?).to be_truthy
      expect(response.failure?).to be_falsey
    end
  end
end
