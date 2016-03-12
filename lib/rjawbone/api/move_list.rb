module Rjawbone
  module API
    module MoveList

      include Rjawbone::Utils

      MOVES = "#{Rjawbone::USER_ENDPOINT}/moves"

      def move_list(params = {})
        perform_get_with_object(build_endpoint(MOVES, params),
                                auth_header, 
                                Rjawbone::Model::MoveList)
      end

    end
  end
end
