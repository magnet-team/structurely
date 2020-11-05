RSpec.describe Structurely::Configuration do
  subject { described_class }

  describe "#endpoint" do
    before { stub_const("Structurely::Configuration::DEFAULT_API_ENDPOINT", "https://example.com") }
    it { expect(subject.new.endpoint).to eq("https://example.com") }
  end

  describe "#app_name" do
    before { stub_const("Structurely::Configuration::DEFAULT_APP_NAME", "foo") }
    it { expect(subject.new.app_name).to eq("foo") }
  end

  describe "#page_size" do
    before { stub_const("Structurely::Configuration::DEFAULT_PAGE_SIZE", 1) }
    it { expect(subject.new.page_size).to eq(1) }
  end

  describe "#key" do
    it "defaults to env variable" do
      allow(ENV).to receive(:[]).with("STRUCTURELY_API_KEY").and_return("test")
      expect(subject.new.key).to eq("test")
    end
  end
end
