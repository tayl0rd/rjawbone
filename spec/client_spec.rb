describe Rjawbone::Client do 

  describe '#user_token?' do
    it 'returns true if the token and refresh token are present' do 
      client = Rjawbone::Client.new(access_token: 'AT', refresh_token: 'RT')
      expect(client.user_token?).to be true
    end
  end

end
