describe Rjawbone do 

  after(:all) do 
    Rjawbone.clear_config
  end

  describe ".configuration" do 
    it "returns the same object every time" do 
      expect(Rjawbone.configuration).to equal(Rjawbone.configuration)
    end
  end

  describe ".configure" do 
    it "yields the current configuration" do 
      Rjawbone.configure do |config|
        expect(config).to equal(Rjawbone::configuration)
      end
    end
  end

  describe ".configuration=" do 
    it "sets the configuration object" do 
      configuration = Rjawbone::Configuration.new

      Rjawbone.configuration = configuration

      expect(Rjawbone.configuration).to equal(configuration)
    end
  end

  describe ".clear_config" do 
    it "clears the configurations set" do 
      configuration = Rjawbone::Configuration.new
      configuration.client_id = "9234802"
      configuration.client_secret = "349283"
      configuration.redirect_uri = "349203409"

      Rjawbone.configuration = configuration

      Rjawbone.clear_config

      expect(Rjawbone.configuration.client_id).to be_nil
      expect(Rjawbone.configuration.client_secret).to be_nil
      expect(Rjawbone.configuration.redirect_uri).to be_nil

    end
  end
end
