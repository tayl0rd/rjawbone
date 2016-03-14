require "rjawbone/models/moves/moves"

module Rjawbone
  module API
    module Moves

      include Rjawbone::Utils

      def move_list(params = {})
        perform_get_with_object(build_endpoint(Rjawbone::USER_MOVES, params),
                                auth_header, 
                                Rjawbone::Model::Moves::List)
      end

      def move_details(xid)
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}"
        perform_get_with_object(build_endpoint(url), 
                                auth_header,
                                Rjawbone::Model::Moves::Details)
      end

      def move_graph(xid)
        endpoint = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/image"
        # TODO
      end

      def move_ticks(xid)
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/ticks"
        perform_get_with_object(build_endpoint(url), 
                                auth_header,
                                Rjawbone::Model::Moves::Ticks)
      end

    end
  end
end
