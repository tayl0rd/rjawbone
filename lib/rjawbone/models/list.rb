module Rjawbone
  module Model
    class List < Base
      attr_reader :size, :next, :page_token, :user_xid

      def initialize(response)
        super(response)
        @user_xid = response["meta"]["user_xid"]
        @size = response["data"]["size"]
        if @size == 10 && response["data"]["links"]
          next_link = response["data"]["links"]["next"]
          @next = Rjawbone::JAWBONE_URL + next_link 
          @page_token = parse_token(next_link)
        end
      end

      private 

      def parse_token(link)
        %r{page_token=(\d+)}.match(link)[1]
      end

    end
  end
end
