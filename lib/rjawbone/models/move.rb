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
          end
        end
      end

      class Details 

        def initialize(data)
          data.each {|k, v| instance_variable_set(:"@#{k}", v)}
        end

      end

    end
  end
end
