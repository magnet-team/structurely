require "structurely/entity/conversation_settings"
require "structurely/entity/conversation_slot"
require "structurely/entity/conversation_item"

module Structurely
  module Entity
    class Conversation < Entity
      client_service ConversationClient

      attr_entity :muted, :id
      attr_entity :stages, &:to_a

      has_entity :settings, as: Structurely::Entity::ConversationSettings
      has_entities :slots, as: Structurely::Entity::ConversationSlot
      has_entities :messages, as: Structurely::Entity::ConversationItem
    end
  end
end
