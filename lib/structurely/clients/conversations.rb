module Structurely
  module Clients
    class Conversations < BaseClient
      structurely_api :conversations

      # Calls GET /conversations/:id
      #
      # @example
      #   Structurely::Clients::Conversations.new.show('test-conversation-id')
      # @see https://docs.structurely.com/#conversations-get-conversation
      def show(id)
        get(id)
      end

      # Calls POST /conversations
      #
      # @example
      #   Structurely::Clients::Conversations.new.create(**options)
      # @see https://docs.structurely.com/#conversations-create-conversation
      def create(options)
        post(json: options)
      end
    end
  end
end
