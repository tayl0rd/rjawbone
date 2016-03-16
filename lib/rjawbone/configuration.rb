module Rjawbone
  class Configuration
    attr_accessor :client_id, :client_secret, :redirect_uri
    attr_reader :scope

    def scope=(scopes)
      @scope=scopes.join(" ")
    end

    def oauth_validated?
      !!(client_id && client_secret && redirect_uri && scope)
    end
  end
end
