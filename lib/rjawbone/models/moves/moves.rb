module Rjawbone
  module Model
    module Moves
      class List < Rjawbone::Model::List
        attr_reader :moves

        include Enumerable

        def initialize(response, client = nil)
          super(response, client)
          @moves = response["data"]["items"].map do |move|
            Rjawbone::Model::Moves::Move.new(move, client)
          end
        end

        def each(&block)
          moves.each(&block)
        end

        def next_page
          client.move_list(page_token: @page_token)
        end
      end

      class Move < Rjawbone::Model::Item

        def initialize(response, client = nil)
          super(response, client)
        end

        def get_details(data)
          Rjawbone::Model::Moves::Details.new(data)
        end

      end

      class Ticks < Rjawbone::Model::List

        def initialize(response)
          super(response)
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
