module Structurely
  module Clients
    class ConversationWebhooks < ApiStruct::Client
      structurely_api :conversation_webhooks

      # Calls GET /conversationWebooks
      #
      # @example
      #   Structurely::Clients::ConversationWebhooks.new.index
      # @see https://docs.structurely.com/#conversation-webhooks-list-conversation-webhooks
      def index
        get(path: "conversationWebhooks")
      end

      # Calls GET /conversationWebhooks/:id
      #
      # @example
      #   Structurely::Clients::ConversationWebhooks.new.show('test-conversation-webhook-id')
      # @see https://docs.structurely.com/#conversation-webhooks-get-conversation-webhook
      def show(id)
        get(id, path: "conversationWebhooks")
      end

      # Calls POST /conversationWebhooks
      #
      # @example
      #   Structurely::Clients::ConversationWebhooks.new.create({ foo: "bar" })
      # @see https://docs.structurely.com/#conversation-webhooks-create-conversation-webhook
      def create(post_data)
        post(json: post_data, path: "conversationWebhooks")
      end

      # Calls PATCH /conversationWebhooks/:id
      #
      # @example
      #   Structurely::Clients::ConversationWebhooks.new.update("abcde", { foo: "bar" })
      # @see https://docs.structurely.com/#conversation-webhooks-update-conversation-webhook
      def update(id, post_data)
        patch(id, json: post_data, path: "conversationWebhooks")
      end

      # Calls DELETE /conversationWebhooks/:id
      #
      # @example
      #   Structurely::Clients::ConversationWebhooks.new.delete("abcde")
      # @see https://docs.structurely.com/#conversation-webhooks-delete-conversation-webhook
      def destroy(id)
        delete(id, path: "conversationWebhooks")
      end
    end
  end
end
