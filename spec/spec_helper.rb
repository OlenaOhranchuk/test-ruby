# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'factory_bot_rails'
require 'acceptance_group_helpers'
require 'acceptance_helpers'
require 'helpers'
require 'shoulda/matchers'

FactoryBot.factories.clear
FactoryBot.reload

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.extend AcceptanceGroupHelpers, type: :acceptance
  config.include AcceptanceHelpers, type: :acceptance
  config.include Helpers
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  # Add Content-Type header to all acceptance examples.
  config.before :each do |example|
    if example.metadata[:type] == :acceptance
      header 'Content-Type', 'application/json'
    end
  end
end

RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join('app', 'views', 'api', 'v1', 'api')
  config.format = :open_api
  config.request_body_formatter = proc { |params| params.to_json }
  config.client_method = :api_client
  config.response_headers_to_include = %w[
    Content-Length
    Content-Type
    access-token
    token-type
    token
    client
    expiry
    uid
  ]
end
