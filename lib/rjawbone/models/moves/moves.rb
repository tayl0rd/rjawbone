module Rjawbone
  module Model
    module Moves
      class List < Rjawbone::Model::List
        attr_reader :moves

        include Enumerable

        def initialize(response)
          super(response)
          @moves = response["data"]["items"].map do |move|
            Rjawbone::Model::Moves::Move.new(move)
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
          response.each do |key, value|
            if key == "details"
              @details = Rjawbone::Model::Moves::Details.new(value)
            else
              instance_variable_set(:"@#{key}", value)
              self.class.send(:attr_reader, key)
            end
          end
        end

      end

      class Details < Rjawbone::Model::Details
        def initialize(data)
          data.each do |key, value| 
            instance_variable_set(:"@#{key}", value)
            self.class.send(:attr_reader, key)
          end
        end
      end

    end
  end
end
