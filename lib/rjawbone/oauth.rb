module Rjawbone
  class Oauth

    extend Rjawbone::Utils

    def self.authorization_url
      check_oauth_config
      query = {
        :response_type => "code",
        :client_id => Rjawbone.configuration.client_id,
        :scope =>  Rjawbone.configuration.scope,
        :redirect_uri => Rjawbone.configuration.redirect_uri
      }
      build_endpoint(Rjawbone::AUTHORIZATION_URL, query)
    end

    def self.exchange_code(code)
      check_oauth_config
      params = {
        :code => code,
        :grant_type => "authorization_code",
        :client_id => Rjawbone.configuration.client_id,
        :client_secret => Rjawbone.configuration.client_secret
      }
      JSON.parse RestClient.post(Rjawbone::TOKEN_URL, params)
    end

  end
end
