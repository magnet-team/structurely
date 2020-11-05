module Structurely
  module Entities
    class Conversation < BaseEntity
      client_service Clients::Conversations

      attr_entity :muted, :id
      attr_entity :stages, &:to_a

      has_entity :settings, as: Entities::ConversationSettings
      has_entities :slots, as: Entities::ConversationSlot
      has_entities :messages, as: Entities::ConversationItem
    end
  end
end
