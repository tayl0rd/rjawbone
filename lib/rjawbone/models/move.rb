module Rjawbone
  module Model
    class Move

      attr_reader :details

      def initialize(response)
        response.each do |key, value|
          if key == "details"
            @details = Details.new(value)
          else
            instance_variable_set(:"@#{key}", value)
            self.class.send(:attr_reader, key)
          end
        end
      end

      class Details 

        def initialize(data)
          data.each do |key, value| 
            instance_variable_set(:"@#{key}", value)
            self.class.send(:attr_reader, key)
          end
        end

      end

    end
  end
end
