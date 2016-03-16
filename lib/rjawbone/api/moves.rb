module Rjawbone
  module API
    module Moves

      def move_list(params = {})
        get_object(build_endpoint(Rjawbone::MOVES_USER, params), Rjawbone::Model::List)
      end

      def move_details(xid, params = {})
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}"
        get_object(build_endpoint(url, params), Rjawbone::Model::Details)
      end

      def move_graph(xid, params = {})
        endpoint = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/image"
        # TODO
      end

      def move_ticks(xid, params = {})
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/ticks"
        get_object(build_endpoint(url, params), Rjawbone::Model::List)
      end

    end
  end
end
