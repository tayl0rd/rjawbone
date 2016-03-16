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

    end
  end
end
