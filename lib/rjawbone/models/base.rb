module Rjawbone
  module Model
    class Base

      attr_accessor :client

      def initialize(client = nil)
        @client = client
      end

    end
  end
end
