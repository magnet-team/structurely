module Structurely
  module Concerns
    # Wrapper for responses
    # raises errors instead of returning monads
    module ErrorHandler
      include Exception

      # Extension of ApiStruct's failure method
      #
      # Raises errors instead of returning falsey objects
      # @see https://github.com/rubygarage/api_struct/blob/master/lib/api_struct/client.rb#L55
      def failure(response)
        parsed_response = JSON.parse(response.body.to_s)
        Console.logger.error("Structurely", "Code: #{parsed_response["code"]}", "Error Message: #{parsed_response["message"]}")
        raise RequestError, parsed_response["message"]
      rescue JSON::ParserError => error
        Console.logger.failure(self, error)
        raise RequestError, response.status
      end

      # Extension of ApiStruct's wrap method
      #
      # @see https://github.com/rubygarage/api_struct/blob/master/lib/api_struct/client.rb#L45
      def wrap(response)
        return failure(response) if response.status >= 300

        success(response)
      end
    end
  end
end
