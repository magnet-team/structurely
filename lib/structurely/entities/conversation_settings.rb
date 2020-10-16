module Structurely
  module Entities
    class ConversationSettings < ApiStruct::Entity
      attr_entity :time_zone, :holmes_name, :drip_campaign_enabled, :re_drips_enabled
      attr_entity :lead_types, &:to_a
      attr_entity :allowed_domains, &:to_a
    end
  end
end
