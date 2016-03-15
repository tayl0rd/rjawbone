module Rjawbone
  module Model
    module Sleeps

      class List < Rjawbone::Model::List
        def initialize(response)
          super(response)
        end

        def get_collection(response)
          Rjawbone::Model::Sleeps::Item.new(response)
        end
      end

      class Item < Rjawbone::Model::Item
        def initialize(response)
          super(response)
        end
        
        def get_details(response)
          Rjawbone::Model::Sleeps::Details.new(response)
        end
      end

      class Details < Rjawbone::Model::Details
        def initialize(response)
          super(response)
        end
      end

    end
  end
end
