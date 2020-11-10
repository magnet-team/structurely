require_relative "base_client"

module Structurely
  module Client
    class ConversationClient < BaseClient
      # Calls GET /conversations/:id
      #
      def show(id)
        get(path: "conversations/#{id}")
      end

      # Calls POST /conversations
      #
      def create(settings: nil, slots: [], muted: false, messages: [])
        data = {settings: settings, slots: slots, muted: muted, messages: messages}.to_json
        post(path: "conversations/", json: data)
      end

      alias_method :find_conversation, :show
      alias_method :create_conversation, :create
    end
  end
end
