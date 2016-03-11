require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'rjawbone'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
end

WebMock.disable_net_connect!(allow: 'codeclimate.com')
