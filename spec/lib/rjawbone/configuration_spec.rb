describe Rjawbone::Configuration do 

  describe '#scope=' do 
    it 'converts an array of scopes into strings' do 
      configuration = Rjawbone::Configuration.new
      configuration.scope = %w(a b c)
      expect(configuration.scope).to eq("a b c")
    end
  end

  describe '#oauth_validated?' do 
    it 'returns true if the client id, secret, callback, and scope are set' do 
      config = Rjawbone::Configuration.new
      config.client_id = "client"
      config.client_secret = "secret"
      config.callback_url = "callback"
      config.scope = ["basic_read"]
      expect(config.oauth_validated?).to be true
    end

    it 'returns false if one of the oauth params is not set' do 
      config = Rjawbone::Configuration.new
      config.client_id = "client"
      config.client_secret = "secret"
      config.callback_url = "callback"
      expect(config.oauth_validated?).to be false
    end
  end

end
