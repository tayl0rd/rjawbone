describe Rjawbone::Model::List do 

  let(:paginated_response) do 
    {
      "meta" => {
        "user_xid" => "123"
      },
      "data" => {
        "size" => 1,
        "links" => {
          "next" => "next_url"
        },
        "items" => [
          {
            "attribute" => 1
          },
          {
            "attribute" => 2
          }
        ]
      }
    }
  end

  describe '#initialize' do 
    let (:list) { Rjawbone::Model::List.new(paginated_response) }

    it 'should be initialized' do 
      expect(list).to be_instance_of Rjawbone::Model::List
    end

    it 'should create a collection of items' do 
      expect(list.collection).to be_instance_of Array
      expect(list.collection.first).to be_instance_of Rjawbone::Model::Item
    end

    it 'should respond to enumerable method' do 
      expect(list).to respond_to(:each, :map)
    end

    it 'returns an empty object if given a hash without data and meta' do 
      empty_response = {"data" => "1"}
      new_list = Rjawbone::Model::List.new(empty_response)
      expect(new_list.size).to be_nil
      expect(new_list.collection).to be_nil
      expect(new_list.user_xid).to be_nil
    end

  end

end
