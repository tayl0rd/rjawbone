module Rjawbone
  module Model
    class Base

      attr_accessor :client, :type

      def initialize(response = {})
        @client = response["client"] if response["client"]
        @type = response["type"] if response["type"]
      end

    end
  end
end
