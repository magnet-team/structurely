RSpec.describe Structurely::Entities::ConversationSettings do
  subject { described_class }
  let(:settings) do
    subject.new(
      time_zone: "America/Chicago",
      holmes_name: "Aisa",
      lead_types: ["buyer", "seller"],
      allowed_domains: ["real_estate"],
      drip_campaign_enabled: false,
      re_drips_enabled: false
    )
  end

  describe "#time_zone" do
    it { expect(settings.time_zone).to eq("America/Chicago") }
  end

  describe "#holmes_name" do
    it { expect(settings.holmes_name).to eq("Aisa") }
  end

  describe "#lead_types" do
    it { expect(settings.lead_types.size).to eq(2) }
    it { expect(settings.lead_types.first).to eq("buyer") }
  end

  describe "#allowed_domains" do
    it { expect(settings.allowed_domains.size).to eq(1) }
    it { expect(settings.allowed_domains.first).to eq("real_estate") }
  end

  describe "#drip_campaign_enabled" do
    it { expect(settings.drip_campaign_enabled).to be_falsey }
  end

  describe "#re_drips_enabled" do
    it { expect(settings.re_drips_enabled).to be_falsey }
  end

  describe "#entity" do
    it { expect(settings.entity.class).to eq(Hashie::Mash) }
  end
end
