require 'dotenv'
Dotenv.load

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'rjawbone'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.ignore_hosts 'codeclimate.com'

  config.filter_sensitive_data('<TOKEN>') { ENV['TOKEN'] }
end

