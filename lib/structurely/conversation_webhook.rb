module Structurely
  class ConversationWebhook < ApiStruct::Entity
    client_service Structurely::Clients::ConversationWebhooks

    attr_entity :id, :name, :target, :secret, :version, :created_at, :updated_at
    attr_entity :triggers, &:to_a
  end
end
