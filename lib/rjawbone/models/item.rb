module Rjawbone
  module Model
    class Item < Base

      attr_reader :details

      def initialize(response = {})
        super(response)
        response.each do |key, value|
          if key == "details"
            @details = Details.new(value)
          else
            instance_variable_set(:"@#{key}", value)
            self.class.send(:attr_reader, key)
          end
        end
      end

      def ticks
        case type
        when "move"
          get_ticks(Rjawbone::MOVES_ENDPOINT)
        when "sleep"
          get_ticks(Rjawbone::SLEEPS_ENDPOINT)
        end
      end

      private

      def get_ticks(endpoint)
        client.get_object("#{endpoint}/#{xid}/ticks", List)
      end

    end
  end
end
