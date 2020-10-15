module Structurely
  class Settings
    extend ::Dry::Configurable

    setting :api_key, ENV["STRUCTURELY_API_KEY"]
    setting :api_endpoint, ENV["STRUCTURELY_API_ENDPOINT"]
  end
end
