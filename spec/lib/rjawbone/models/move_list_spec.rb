describe Rjawbone::Model::MoveList do 
  
  let(:client) { Rjawbone::Client.new(access_token: ENV['TOKEN'] || 'AT') }

  describe 'client#move_list', :vcr do 

    it 'should create an instance of MoveList' do 
      move_list = client.move_list
      expect(move_list).to be_an_instance_of(Rjawbone::Model::MoveList)
    end

  end

end
