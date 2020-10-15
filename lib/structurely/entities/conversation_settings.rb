module Structurely
  module Entities
    class ConversationSettings < ApiStruct::Entity
      attr_entity :timeZone, :holmesName, :dripCampaignEnabled, :reDripsEnabled
      attr_entity :leadTypes, &:to_a
      attr_entity :allowedDomains, &:to_a
    end
  end
end
