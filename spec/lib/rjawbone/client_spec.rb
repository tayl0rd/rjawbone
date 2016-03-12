describe Rjawbone::Client do

  describe '#user_token?' do
    it 'returns true if the token and refresh token are present' do 
      client = Rjawbone::Client.new(access_token: 'AT', refresh_token: 'RT')
      expect(client.user_token?).to be true
    end

    it 'returns false if the token or refresh is not present' do 
      client = Rjawbone::Client.new
      expect(client.user_token?).to be false
    end
  end

  describe '#auth_header' do
    it 'raises Rjawbone::NoAccessToken if token is not present' do 
      client = Rjawbone::Client.new
      expect {client.auth_header}.to raise_error(Rjawbone::NoAccessToken)
    end
  end

end
