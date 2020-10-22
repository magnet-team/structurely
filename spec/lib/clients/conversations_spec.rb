RSpec.describe Structurely::Clients::Conversations do
  subject { described_class.new }

  describe "#headers" do
    specify { expect(subject.headers[:"Content-Type"]).to eq("application/json") }
    specify { expect(subject.headers[:"X-Api-Authorization"]).to eq("test") }
    specify { expect(subject.api_root).to eq("https://api.test.structurely.com/v1") }
  end

  describe "#show" do
    context "when the record exists" do
      it "returns success" do
        stub = stub_request(:get, /conversations/).to_return(status: 200, body: load_json("conversations_get").to_json)
        response = subject.show("5f89abd220c8880031b975cc")

        expect(stub).to have_been_requested
        expect(response.success?).to be_truthy
        expect(response.failure?).to be_falsey
      end
    end

    context "when the record does not exist" do
      it "returns failure" do
        stub = stub_request(:get, /conversations/).to_return(status: 404, body: {code: 404, message: "Conversation does not exist"}.to_json)
        response = subject.show("foobar")

        expect(stub).to have_been_requested
        expect(response.success?).to be_falsey
        expect(response.failure?).to be_truthy
      end
    end
  end

  describe "#create" do
    context "when the record is persisted" do
      it "returns success" do
        stub = stub_request(:post, /conversations/).to_return(status: 201, body: load_json("conversations_post").to_json)

        response = subject.create(
          muted: false,
          settings: Structurely::Entities::ConversationSettings.new(
            time_zone: "America/Chicago"
          ),
          slots: [
            Structurely::Entities::ConversationSlot.new(
              name: "email",
              value: "jdoe@example.com"
            )
          ],
          messages: [
            Structurely::Entities::ConversationItem.new(
              response: Structurely::Entities::ConversationMessage.new(
                text: "Hello, what is your name?",
                received: "2018-12-08T15:20:00.000Z"
              ),
              context: "expect_name",
              message: Structurely::Entities::ConversationMessage.new(
                text: "John",
                received: "2018-12-08T16:34:00.000Z"
              )
            )
          ]
        )

        expect(stub).to have_been_requested
        expect(response.success?).to be_truthy
        expect(response.failure?).to be_falsey
      end
    end

    context "when the record is not persisted" do
      it "returns failure" do
        stub = stub_request(:post, /conversations/).to_return(status: 400, body: load_json("conversations_post").to_json)

        response = subject.create(
          muted: false,
          settings: Structurely::Entities::ConversationSettings.new(
            time_zone: "America/Chicago"
          ),
          slots: [
            Structurely::Entities::ConversationSlot.new(
              name: "email",
              value: "jdoe@example.com"
            )
          ],
          messages: [
            Structurely::Entities::ConversationItem.new(
              response: Structurely::Entities::ConversationMessage.new(
                text: "Hello, what is your name?",
                received: "2018-12-08T15:20:00.000Z"
              ),
              context: "expect_name",
              message: Structurely::Entities::ConversationMessage.new(
                text: "John",
                received: "2018-12-08T16:34:00.000Z"
              )
            )
          ]
        )

        expect(stub).to have_been_requested
        expect(response.success?).to be_falsey
        expect(response.failure?).to be_truthy
      end
    end
  end
end
