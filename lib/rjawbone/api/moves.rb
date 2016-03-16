module Rjawbone
  module API
    module Moves

      def move_list(params = {})
        perform_get_with_object(build_endpoint(Rjawbone::USER_MOVES, params),
                                auth_header, 
                                Rjawbone::Model::List)
      end

      def move_details(xid)
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}"
        perform_get_with_object(build_endpoint(url), 
                                auth_header,
                                Rjawbone::Model::Details)
      end

      def move_graph(xid)
        endpoint = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/image"
        # TODO
      end

      def move_ticks(xid)
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/ticks"
        perform_get_with_object(build_endpoint(url), 
                                auth_header,
                                Rjawbone::Model::List)
      end

    end
  end
end
