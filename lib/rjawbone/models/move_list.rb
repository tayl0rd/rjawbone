module Rjawbone
  module Model
    class MoveList < Base

      attr_reader :moves

      include Enumerable

      def initialize(response)
        super(response)
        @moves = response["data"]["items"].map do |move|
          Rjawbone::Model::Move.new(move)
        end
      end

      def each(&block)
        moves.each(&block)
      end

      def next_page
        client.move_list(page_token: @page_token)
      end

    end
  end
end
