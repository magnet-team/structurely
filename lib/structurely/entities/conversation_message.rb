module Structurely
  module Entities
    class ConversationMessage < ApiStruct::Entity
      attr_entity :text, :received

      has_entity :_metadata, as: Structurely::Entities::MessageMetaData
    end
  end
end
