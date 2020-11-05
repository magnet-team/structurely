require "api_struct"
require "dry-configurable"
require "structurely/version"
require "structurely/configuration"

module Structurely
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

require "structurely/clients/base_client"
require "structurely/clients/conversations"

require "structurely/entities/base_entity"
require "structurely/entities/conversation"
require "structurely/entities/conversation_settings"
require "structurely/entities/message_meta_data"
require "structurely/entities/conversation_message"
require "structurely/entities/conversation_item"
require "structurely/entities/conversation_slot"
