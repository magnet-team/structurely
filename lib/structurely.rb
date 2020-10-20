require "structurely/version"
require "api_struct"
require "dry-configurable"

require "structurely/settings"
require "structurely/api_struct_settings"

require "structurely/clients/conversations"

require "structurely/entities/conversation_settings"
require "structurely/entities/message_meta_data"
require "structurely/entities/conversation_message"
require "structurely/entities/conversation_item"
require "structurely/entities/conversation_slot"

require "structurely/conversation"

module Structurely
  class Error < StandardError; end
end
