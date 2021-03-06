require 'pry'
require 'uri'
require 'rest-client'

require "rjawbone/version"
require "rjawbone/configuration"
require "rjawbone/endpoints"
require "rjawbone/utils"
require "rjawbone/oauth"
require "rjawbone/api"
require "rjawbone/client"
require "rjawbone/rails" if defined?(::Rails)

module Rjawbone

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Rjawbone::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.clear_config
    @configuration = nil
  end

  class ConfigurationNotImplemented < StandardError; end

  class NoAccessToken < StandardError; end

end
