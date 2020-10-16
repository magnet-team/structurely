module Structurely
  module Entities
    class ConversationSettings < ApiStruct::Entity
      attr_entity :time_zone
      attr_entity :holmes_name
      attr_entity :drip_campaign_enabled
      attr_entity :re_drips_enabled
      attr_entity :lead_types, &:to_a
      attr_entity :allowed_domains, &:to_a

      # alias_method :timeZone, :time_zone
      # alias_method :holmesName, :holmes_name
      # alias_method :dripCampaignEnabled, :drip_campaign_enabled
      # alias_method :reDripsEnabled, :re_drips_enabled
      # alias_method :lead_types, :leadTypes
      # alias_method :allowed_domains, :allowedDomains
    end
  end
end
