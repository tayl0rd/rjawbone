module Rjawbone
  module Model
    module Moves
      class List < Rjawbone::Model::List

        def initialize(response = {})
          super(response)
        end

        def get_collection(item)
          Rjawbone::Model::Moves::Move.new(item)
        end

      end

      class Move < Rjawbone::Model::Item

        def initialize(response)
          super(response)
        end

        def get_details(data)
          Rjawbone::Model::Moves::Details.new(data)
        end

        def ticks
          client.move_ticks(self.xid)
        end

      end

      class Ticks < Rjawbone::Model::List

        def initialize(response)
          super(response)
        end

        def get_collection(item)
          Rjawbone::Model::Moves::Tick.new(item)
        end

      end

      class Tick < Rjawbone::Model::Item

        def initialize(response)
          super(response)
        end

      end

      class Details < Rjawbone::Model::Details

        def intialize(data)
          super(data)
        end

      end

    end
  end
end
