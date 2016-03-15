module Rjawbone
  module Model
    module Moves
      class List < Rjawbone::Model::List
        attr_reader :moves

        include Enumerable

        def initialize(response = {})
          if response["data"] && response["meta"]
            super(response)
            @moves = response["data"]["items"].map do |move|
              move.merge!({"client" => response["client"]})
              Rjawbone::Model::Moves::Move.new(move)
            end
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
        attr_reader :ticks
        include Enumerable

        def initialize(response)
          super(response)
          @ticks = response["data"]["items"].map do |item|
            Rjawbone::Model::Moves::Tick.new(item)
          end
        end

        def each(&block)
          ticks.each(&block)
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
