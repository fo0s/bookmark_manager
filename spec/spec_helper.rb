# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Reset database each time this file runs
require_relative 'setup_test_database'

require File.join(File.dirname(__FILE__), '..', './app.rb')

# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager

# Set rspec up to testing environment
ENV['ENVIRONMENT'] = 'test'

# Configuraton settings
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    setup_test_database
  end

  # Seed global randomization
  # srand RSpec.configuration.seed
  # config.mock_with :rspec do |mocks|
  #   mocks.verify_partial_doubles = true
  # end

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  # config.example_status_persistence_file_path = 'spec/examples.txt'

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  # config.warnings = true

  # Verbose mode
  # config.default_formatter = 'doc' if config.files_to_run.one?

  # Speed up tests
  # config.profile_examples = 10
end
