module Rjawbone
  module Utils

    def check_oauth_config
      unless Rjawbone.configuration && Rjawbone.configuration.oauth_validated?
        raise Rjawbone::ConfigurationNotImplemented, "Authorization config has not been set"
      end
    end

    def perform_get(url, headers = {})
      RestClient.get(url, headers)
    end

    def perform_post(url, payload, headers = {})
      RestClient.post(url, payload, headers)
    end

    def perform_get_with_object(url, headers, klass)
      response = perform_get(url, headers)
      klass.new(response)
    end

    def perform_post_with_object(url, payload, headers = {}, klass)
      response = perform_post(url, payload, headers)
      klass.new(response)
    end

  end
end
