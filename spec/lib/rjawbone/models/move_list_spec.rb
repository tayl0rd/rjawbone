describe Rjawbone::Model::MoveList, :vcr do 
  
  let(:client) { Rjawbone::Client.new(access_token: ENV['TOKEN'] || 'AT') }
  let(:move_list) { client.move_list }

  it 'returns the latest n moves of the user' do 
    expect(move_list.moves).to be_an Array
    expect(move_list.moves.first).to be_a Rjawbone::Model::Move
  end

  it 'returns the correct move based on the date' do 
    list = client.move_list(date: 20160311)
    expect(list.moves.first.date).to eq(20160311)
  end

  describe '#next_page' do

    it 'returns the next page of the move_list' do
      next_page = move_list.next_page
      expect(next_page.moves.first).not_to eq(move_list.moves.first)
    end

  end


end
