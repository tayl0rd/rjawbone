module Rjawbone
  module Model
    class Base

      attr_accessor :client

      def initialize(response = {})
        @client = response["client"] if response["client"]
      end

    end
  end
end
