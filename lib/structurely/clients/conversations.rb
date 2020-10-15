module Structurely
  module Clients
    class Conversations < ApiStruct::Client
      structurely_api :conversations

      def show(id)
        get(id)
      end

      def create(settings:, slots:, muted:, messages:)
        post(
          body: {
            settings: settings,
            slots: slots,
            muted: muted,
            messages: messages
          }.to_json
        )
      end
    end
  end
end
