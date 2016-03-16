module Rjawbone
  module API
    module HeartRate

      def heart_rate
        perform_get_with_object(Rjawbone::HEARTRATE_ENDPOINT, 
                                auth_header,
                                Rjawbone::Model::List)
      end

    end
  end
end
