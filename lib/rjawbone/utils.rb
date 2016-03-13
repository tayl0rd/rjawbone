module Rjawbone
  module Utils

    def check_oauth_config
      unless Rjawbone.configuration && Rjawbone.configuration.oauth_validated?
        raise Rjawbone::ConfigurationNotImplemented.new "Authorization config has not been set"
      end
    end

    def get(url, headers = {})
      RestClient.get(url, headers)
    end

    def post(url, payload, headers = {})
      RestClient.post(url, payload, headers)
    end

    def perform_get_with_object(url, headers, klass)
      response = JSON.parse get(url, headers)
      build_object(klass, response)
    end

    def perform_post_with_object(url, payload, headers = {}, klass)
      response = JSON.parse post(url, payload, headers)
      build_object(klass, response)
    end

    def build_endpoint(base, params)
      if params && !params.empty?
        query_params = URI.encode_www_form(params)
        base += "?#{query_params}"
      end
      base
    end

    private 

    def build_object(klass, response)
      klass = klass.new(response)
      klass.client = self
      klass
    end

  end
end
