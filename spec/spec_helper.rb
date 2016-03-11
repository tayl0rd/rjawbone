require 'rjawbone'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
end

