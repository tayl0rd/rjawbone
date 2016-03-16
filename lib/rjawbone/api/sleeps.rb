module Rjawbone
  module API
    module Sleeps

      def sleeps
        get_object(Rjawbone::SLEEPS_USER, Rjawbone::Model::List)
      end

      def sleep_details(xid, params = {})
        url = "#{Rjawbone::SLEEPS_ENDPOINT}/#{xid}"
        get_object(build_endpoint(url, params), Rjawbone::Model::Details)
      end

      def sleeps_graph(xid, params = {})
        endpoint = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/image"
        # TODO
      end

      def sleep_ticks(xid, params = {})
        url = "#{Rjawbone::MOVES_ENDPOINT}/#{xid}/ticks"
        get_object(build_endpoint(url, params), Rjawbone::Model::List)
      end

    end
  end
end
