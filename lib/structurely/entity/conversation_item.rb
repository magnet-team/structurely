require "structurely/entity/conversation_message"

module Structurely
  module Entity
    class ConversationItem < Entity
      attr_entity :context

      has_entity :message, as: Structurely::Entity::ConversationMessage
      has_entity :response, as: Structurely::Entity::ConversationMessage
    end
  end
end
