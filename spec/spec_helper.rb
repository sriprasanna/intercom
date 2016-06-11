require File.expand_path(File.dirname(__FILE__) + '/../lib/flatten')
require File.expand_path(File.dirname(__FILE__) + '/../lib/haversine_calculator')
require File.expand_path(File.dirname(__FILE__) + '/../lib/json_file_parser')
require File.expand_path(File.dirname(__FILE__) + '/../lib/customers')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
