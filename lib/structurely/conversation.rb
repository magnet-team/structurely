module Structurely
  class Conversation < ApiStruct::Entity
    client_service Structurely::Clients::Conversations

    attr_entity :muted, :id
    attr_entity :stages, &:to_a

    has_entity :settings, as: Structurely::Entities::ConversationSettings
    has_entities :slots, as: Structurely::Entities::ConversationSlot
    has_entities :messages, as: Structurely::Entities::ConversationItem
  end
end
