module Rjawbone
  module API
    module Sleeps

      def sleep_list
        perform_get_with_object(Rjawbone::USER_SLEEPS,
                                auth_header, 
                                Rjawbone::Model::List)
      end

    end
  end
end
