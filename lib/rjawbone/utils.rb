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

    def get_object(url, klass)
      response = JSON.parse get(url, auth_header)
      build_object(klass, response, self)
    end

    def post_object(url, klass, payload)
      response = JSON.parse post(url, payload, auth_header)
      build_object(klass, response, self)
    end

    def build_endpoint(base, params = {})
      base += "?#{URI.encode_www_form(params)}" if params && !params.empty?
      base
    end

    private 

    def build_object(klass, response, client = nil)
      response.merge!({"client" => client}) if client
      klass.new(response)
    end

  end
end
