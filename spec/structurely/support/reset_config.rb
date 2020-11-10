RSpec.configure do |config|
  config.before(:each) do
    Structurely.reset_config
  end
end
