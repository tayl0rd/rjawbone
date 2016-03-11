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

module Rjawbone

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration = Configuration.new
    yield configuration
  end

  class ConfigurationNotImplemented < StandardError
  end

  class BadToken < StandardError
  end
end
