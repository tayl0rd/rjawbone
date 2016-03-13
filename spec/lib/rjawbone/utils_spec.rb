describe Rjawbone::Utils do 

  let(:included_class) { Class.new { include Rjawbone::Utils } }

  describe '#check_oauth_config' do 
    it 'raises error if configuration is not implemented' do 
      object = included_class.new
      expect { object.check_oauth_config }.to raise_error(Rjawbone::ConfigurationNotImplemented)

    end
  end

end
