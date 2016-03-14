describe Rjawbone::Model::Moves do 
  describe Rjawbone::Model::Moves::Move do 
    it 'can be instantiated' do 
      response = {"details" => {"key" => "value"}}
      move = Rjawbone::Model::Moves::Move.new(response)
      expect(move).to be_instance_of(Rjawbone::Model::Moves::Move)
    end
  end
end
