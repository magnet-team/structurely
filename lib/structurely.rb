# Version
require "version"
# Vendor
require "console"
require "api_struct"
# Exceptions
require "exception/request_error"
# Entities
require "entity/entity"
require "entity/conversation_item"
require "entity/conversation_message"
require "entity/conversation_settings"
require "entity/conversation_slot"
require "entity/conversation"
require "entity/message_meta_data"

# Unofficial Ruby wrapper for Structurely API
#
# @see https://docs.structurely.com
module Structurely
  API_VERSION = "v1"
  DEFAULT_CONTENT_TYPE = "application/json"
  DEFAULT_API_ENDPOINT = "https://api.structurely.com/#{API_VERSION}"

  extend Dry::Configurable
  setting :api_key, ENV["STRUCTURELY_API_KEY"]
  setting :api_endpoint, ENV.fetch("STRUCTURELY_API_ENDPOINT", DEFAULT_API_ENDPOINT)
end
