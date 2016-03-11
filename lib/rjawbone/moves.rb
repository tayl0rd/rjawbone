module Rjawbone
  module Moves

    include Rjawbone::Utils

    MOVES = "#{Rjawbone::USER_ENDPOINT}/moves"

    def move_list(params = {})
      perform_get_with_object(MOVES, auth_header, Rjawbone::Move)
    end

  end
end
