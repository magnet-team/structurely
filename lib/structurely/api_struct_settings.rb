ApiStruct::Settings.configure do |config|
  config.endpoints = {
    structurely_api: {
      root: Structurely::Settings.config.api_endpoint,
      headers: {
        "Content-Type": "application/json",
        "X-Api-Authorization": Structurely::Settings.config.api_key
      }
    }
  }
end
