module Rjawbone
  module API
    module Moves

      include Rjawbone::Utils

      MOVES = "#{Rjawbone::USER_ENDPOINT}/moves"

      def move_list(params = {})
        perform_get_with_object(build_endpoint(MOVES, params),
                                auth_header, 
                                Rjawbone::Model::Moves)
      end

    end
  end
end
