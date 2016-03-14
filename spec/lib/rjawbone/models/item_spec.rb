describe Rjawbone::Model::Item do 

  let(:response) {{:key1 => "value", :key2 => "value"}}

  it 'will raise an error if details are present' do
    params = {"details" => "value"}
    expect {Rjawbone::Model::Item.new(params)}.to raise_error(NotImplementedError)
  end

  it "sets instance variables for all values in response" do 
    item = Rjawbone::Model::Item.new(response)
    expect(item.instance_variable_defined?(:@key1)).to be true
    expect(item.instance_variable_defined?(:@key2)).to be true
  end

   it "creates getters for all values in response" do 
    item = Rjawbone::Model::Item.new(response)
    expect(item.key1).to eq("value")
    expect(item.key2).to eq("value")
   end

end
