module Rjawbone
  module Model
    class Item < Base

      attr_reader :details

      def initialize(response = {})
        super(response)
        response.each do |key, value|
          if key == "details"
            @details = get_details(value)
          else
            instance_variable_set(:"@#{key}", value)
            self.class.send(:attr_reader, key)
          end
        end
      end

      def get_details(data)
        raise NotImplementedError, "Subclass must override"
      end

    end
  end
end
