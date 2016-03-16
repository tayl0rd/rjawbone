describe Rjawbone::Utils do 

  let(:included_class) { Class.new { include Rjawbone::Utils } }

  describe '#check_oauth_config' do 
    it 'raises error if configuration is not implemented' do 
      object = included_class.new
      expect { object.check_oauth_config }.to raise_error(Rjawbone::ConfigurationNotImplemented)
    end

    it 'does not raise an error after configuration is implemented' do 
      Rjawbone.configure do |config|
        config.client_id = "3948230"
        config.client_secret = "123812903"
        config.scope = ["test"]
        config.callback_url = "test"
      end
      object = included_class.new
      expect(object.check_oauth_config).to be_nil
    end
  end

  describe '#build_endpoint' do 
    it 'should return the original url if no params given' do 
      object = included_class.new
      base = "https://www.google.com"
      url = object.build_endpoint(base)
      expect(url).to eq base
    end

    it 'should build the expected url' do 
      object = included_class.new
      base = "https://www.google.com"
      params = {"test" => "1", "hello" => "2" }
      url = object.build_endpoint(base, params)
      expected = "#{base}?test=1&hello=2"
      expect(url).to eq expected
    end

  end

end
