module Rjawbone
  class Client

    include Rjawbone::API

    attr_accessor :access_token, :refresh_token

    def initialize(options = {})
      @access_token = options[:access_token]
      @refresh_token = options[:refresh_token]
      yield self if block_given?
    end

    def user_token?
      !!(access_token && refresh_token)
    end

    def auth_header
      unless access_token
        raise Rjawbone::NoAccessToken.new("No access_token present in client")
      end
      {"Authorization" => "Bearer #{access_token}"}
    end

    def check_refresh

    end

  end
end
