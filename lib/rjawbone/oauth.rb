module Rjawbone
  class Oauth

    OAUTH_ENDPOINT = "https://jawbone.com/auth/oauth2/token"

    extend Rjawbone::Utils

    def self.authorization_url
      check_oauth_config
      base = "https://jawbone.com/auth/oauth2/auth?"
      query = {
        :response_type => "code",
        :client_id => Rjawbone.configuration.client_id,
        :scope =>  Rjawbone.configuration.scope,
        :redirect_uri => Rjawbone.configuration.callback_url
      }
      base + URI.encode_www_form(query)
    end

    def self.exchange_code(code)
      params = build_params(code)
      response = RestClient.post(OAUTH_ENDPOINT, params)
    end

    def self.build_params(code)
      check_oauth_config
      {
        :code => code,
        :grant_type => "authorization_code",
        :client_id => Rjawbone.configuration.client_id,
        :client_secret => Rjawbone.configuration.client_secret
      }
    end

  end
end
