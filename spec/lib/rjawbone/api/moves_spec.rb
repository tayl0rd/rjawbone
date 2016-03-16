describe Rjawbone::API::Moves, :vcr do 

  let(:client) { Rjawbone::Client.new(access_token: ENV['TOKEN']) }
  let(:list) { client.move_list }

  describe '#move_list' do 
    it 'should return a list model' do 
      expect(list).to be_instance_of Rjawbone::Model::List
    end

    it 'should get the next page of results' do 
      next_page = list.next_page
      expect(next_page).to be_instance_of Rjawbone::Model::List
    end
  end

end


