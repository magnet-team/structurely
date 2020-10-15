module Structurely
  module Entities
    class ConversationSlot < ApiStruct::Entity
      attr_entity :name, :value
    end
  end
end
