require 'wit-ruby2'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'vcr'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    $token = ENV['WIT_TOKEN']
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<WIT_TOKEN>") { $token }
end
