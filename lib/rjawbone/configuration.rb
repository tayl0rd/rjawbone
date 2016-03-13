module Rjawbone
  class Configuration
    attr_accessor :client_id, :client_secret, :callback_url
    attr_reader :scope

    def scope=(scopes)
      @scope=scopes.join(" ")
    end

    def oauth_validated?
      !!(client_id && client_secret && callback_url && scope)
    end
  end
end
