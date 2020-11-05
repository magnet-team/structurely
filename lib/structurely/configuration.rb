module Structurely
  class Configuration
    DEFAULT_API_ENDPOINT = "https://api.structurely.com/v1"
    DEFAULT_APP_NAME = "Structurely Ruby Client"
    DEFAULT_PAGE_SIZE = 25

    attr_accessor :endpoint, :app_name, :page_size, :key

    def initialize
      @endpoint = ENV.fetch("STRUCTURELY_API_ENDPOINT", DEFAULT_API_ENDPOINT)
      @app_name = DEFAULT_APP_NAME
      @page_size = DEFAULT_PAGE_SIZE
      @key = ENV["STRUCTURELY_API_KEY"]

      ApiStruct::Settings.configure do |config|
        config.endpoints = build_config[:endpoints]
      end
    end

    def headers
      {
        'User-Agent': app_name,
        'X-Api-Authorization': key,
        'Content-Type': "application/json"
      }
    end

    def build_config
      {
        endpoints: {
          structurely_api: {
            root: endpoint,
            headers: headers
          }
        }
      }
    end
  end
end
