module Structurely
  module Entities
    class ConversationItem < ApiStruct::Entity
      attr_entity :context

      has_entity :message, as: Structurely::Entities::ConversationMessage
      has_entity :response, as: Structurely::Entities::ConversationMessage
    end
  end
end
