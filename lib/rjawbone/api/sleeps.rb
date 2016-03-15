require 'rjawbone/models/sleeps'

module Rjawbone
  module API
    module Sleeps

      include Rjawbone::Utils

      def sleep_list
        perform_get_with_object(Rjawbone::USER_SLEEPS,
                                auth_header, 
                                Rjawbone::Model::Sleeps::List)
      end

    end
  end
end
