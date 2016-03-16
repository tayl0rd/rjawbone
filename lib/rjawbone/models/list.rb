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
        end
        @collection = response["data"]["items"].map do |item|
          item.merge!({"client" => response["client"]}) if response["client"]
          Item.new(item)
        end
      end

      def next_page
        if @next
          client.perform_get_with_object(@next, 
                                         client.auth_header,
                                         Rjawbone::Model::List)
        else
          puts "No more pages."
        end
      end

      def each(&block)
        collection.each(&block)
      end

    end
  end
end
