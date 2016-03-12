describe Rjawbone do 

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
end
