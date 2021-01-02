require "structurely/concerns/error_handler"

module Structurely
  module Client
    class BaseClient < ApiStruct::Client
      include Structurely::Concerns::ErrorHandler
      include Exception

      alias_method :api_struct_delete, :delete
      alias_method :api_struct_get, :get
      alias_method :api_struct_post, :post
      alias_method :api_struct_put, :put

      def request(path:, method: "GET", **options)
        send("api_struct_#{method.downcase}", path: remove_trailing_slash(path), headers: headers, body: options[:json])
      end

      def get(**options)
        request(method: "GET", **options)
      end

      def post(**options)
        request(method: "POST", **options)
      end

      def put(**options)
        request(method: "PUT", **options)
      end

      def delete(**options)
        request(method: "DELETE", **options)
      end

      def api_root
        Structurely.config.api_endpoint
      end

      def headers
        {
          "Content-Type": Structurely::DEFAULT_CONTENT_TYPE,
          "X-Api-Authorization": Structurely.config.api_key.to_s
        }
      end

      private

      def remove_trailing_slash(str)
        str.chomp("/")
      end

      def default_params
        {}
      end
    end
  end
end
