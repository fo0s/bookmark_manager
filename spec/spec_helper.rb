# Require all the testing gems
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

RSpec.configure do |config|
  ENV['ENVIRONMENT'] = 'test'

  config.before(:each) do
    setup_test_database
  end

  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  Capybara.app = BookmarkManager

  srand RSpec.configuration.seed
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
