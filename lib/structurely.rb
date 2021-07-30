require "structurely/version"
require "api_struct"
require "dry-configurable"

require "structurely/settings"
require "structurely/api_struct_settings"

require "structurely/clients/conversations"
require "structurely/clients/conversation_webhooks"

require "structurely/entities/conversation_settings"
require "structurely/entities/message_meta_data"
require "structurely/entities/conversation_message"
require "structurely/entities/conversation_item"
require "structurely/entities/conversation_slot"

require "structurely/conversation"
require "structurely/conversation_webhook"

module Structurely
  class Error < StandardError; end
end
