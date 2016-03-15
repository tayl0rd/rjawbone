module Rjawbone
  module Model
    class List < Base

      include Enumerable

      attr_reader :size, :next, :page_token, :user_xid, :collection

      def initialize(response)
        return unless response["data"] && response["meta"]
        super(response)
        @user_xid = response["meta"]["user_xid"]
        @size = response["data"]["size"]
        if response["data"]["links"]
          next_link = response["data"]["links"]["next"]
          @next = Rjawbone::JAWBONE_URL + next_link 
          @page_token = parse_token(next_link)
        end
        @collection = response["data"]["items"].map do |item|
          item.merge!({"client" => response["client"]}) if response["client"]
          get_collection(item)
        end
      end

      def next_page
        client.move_list(page_token: @page_token)
      end

      def each(&block)
        collection.each(&block)
      end

      def get_collection
        raise NotImplementedError, "Subclass must override"
      end

      private 

      def parse_token(link)
        %r{page_token=(\d+)}.match(link)[1]
      end

    end
  end
end
