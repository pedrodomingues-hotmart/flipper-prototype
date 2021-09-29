require 'factory_bot_rails'
require 'fuubar'
require 'shoulda/matchers'
require 'json_matchers/rspec'
require 'simplecov'
require 'support/database_cleaner'

JsonMatchers.schema_root = 'spec/fixtures/schemas'

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Errors', 'app/errors'
  add_group 'Models', 'app/models'
  add_group 'Use Cases', 'app/use_cases'
  add_group 'Libs', 'lib'

  add_filter 'spec/'
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.fuubar_progress_bar_options = { format: 'Progress(%p%%): %c/%C <%B> %e' }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
