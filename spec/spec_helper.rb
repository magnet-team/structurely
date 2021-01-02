begin
  require "bundler/setup"
  require "dotenv/load"
  require "pry"
  require "webmock/rspec"
rescue LoadError
end

require "dry/configurable/test_interface"
require "structurely"

module Structurely
  enable_test_interface
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

WebMock.disable_net_connect!

RSpec.configure do |config|
  include Structurely::Exception

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
end
