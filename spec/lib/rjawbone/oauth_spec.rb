describe Rjawbone::Oauth do 

  describe '.authorization_url' do 
    
    after(:all) do 
      Rjawbone.clear_config
    end

    it 'should raise error if not configured' do 
      expect { Rjawbone::Oauth.authorization_url }.to raise_error Rjawbone::ConfigurationNotImplemented
    end

    it 'should return string when configured' do 
      configure
      expect(Rjawbone::Oauth.authorization_url).to be_instance_of String
    end

    it 'should match the correct string when configured' do 
      configure
      expected = "#{Rjawbone::AUTHORIZATION_URL}?response_type=code&client_id=123&scope=test&redirect_uri=789"
      expect(Rjawbone::Oauth.authorization_url).to eq expected
    end

  end

  def configure
    Rjawbone.configure do |config|
      config.client_id = "123"
      config.client_secret = "456"
      config.redirect_uri = "789"
      config.scope = ["test"]
    end
  end

end
