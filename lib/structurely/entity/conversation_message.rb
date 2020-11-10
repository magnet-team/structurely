require "structurely/entity/message_meta_data"

module Structurely
  module Entity
    class ConversationMessage < Entity
      attr_entity :text, :received

      has_entity :_metadata, as: Structurely::Entity::MessageMetaData
    end
  end
end
